package com.dms.demo.controllers;

import com.dms.demo.domain.Department;
import com.dms.demo.domain.Worker;
import com.dms.demo.exception.InputFormanException;
import com.dms.demo.service.DepartmentService;
import com.dms.demo.service.WorkerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/department")
public class DepartmentController {

    @Autowired
    private DepartmentService departmentService;

    @Autowired
    private WorkerService workerService;

    @GetMapping
    public String department(Model model) {
        List<Department> departments = departmentService.findAll();
        model.addAttribute("departmentList", departments);  
        return "department";
    }

    @PostMapping(value = "/saveOrUpdate")
    public String saveOrUpdate(@RequestParam(required = false) Long idDepartment,
                               @RequestParam String departmentName) throws InputFormanException {

        Department department = new Department();
        if (departmentName.matches("^-?\\d+$")) {
            throw new InputFormanException("Неверный ввод");
        }
        department.setDepartmentName(departmentName);

        if (idDepartment != null) {
            department.setIdDepartment(idDepartment);
        }
        departmentService.saveOrUpdate(department);

        return "redirect:/department";

    }

    @PostMapping("/removeDepartment")
    public String removeDepartment(@RequestParam(value = "idDepartment", required = false) Long idDepartment) {
        Department department = new Department();
        department.setIdDepartment(idDepartment);
        departmentService.delete(department);
        return "redirect:/department";
    }

    @GetMapping("/enterTheDepartment/{departmentId}")
    public String editDepartment(@PathVariable Long departmentId, Model model) {

        Department department = departmentService.findByIdWithDeps(departmentId);
        List<Worker> workersFromDepartment = department.getWorkersByIdDepartment();
        model.addAttribute("workersFromDepartment", workersFromDepartment);

        List<Worker> workersWithoutDepartment = departmentService.getWorkerWithoutDepartment();
        model.addAttribute("workersWithoutDepartment", workersWithoutDepartment);
        model.addAttribute("department", department);

        return "editDepartment";
    }

    @PostMapping("/enterTheDepartment/{departmentId}/removeWorkerFromDepartment")
        public String removeWorkerFromDepartment(@PathVariable("departmentId") Long departmentId, @RequestParam("idWorker") Long idWorker){
        Worker worker = workerService.findByIdWithWork(idWorker);

        departmentService.removeWorkerFromDepartment(worker);

        return "redirect:/department/enterTheDepartment/" + departmentId + "/";
    }

    @PostMapping("/enterTheDepartment/{departmentId}/addWorkerInDepartment")
        public String addWorkerInDepartment(@PathVariable("departmentId") Long departmentId, @RequestParam("idWorker") Long idWorker){
        Worker worker = workerService.findById(idWorker);
        worker.setDepartmentByIdDepartment(departmentService.findByIdWithDeps(departmentId));


        departmentService.addWorkerInDepartment(worker);

        return "redirect:/department/enterTheDepartment/" + departmentId + "/";
    }

    @GetMapping("/editDepartment/{idDepartment}")
    public String editDepartment(@PathVariable("idDepartment") Department department, Model model){
        model.addAttribute("editDepartment", department);
        return "departmentEdit";
    }

}
