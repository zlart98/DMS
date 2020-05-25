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
@RequestMapping("/worker")
public class WorkerController {
    @Autowired
    private WorkerService workerService;

    @Autowired
    private DepartmentService departmentService;

    @GetMapping
    public String getWorkers(Model model) {
        List<Worker> workers = workerService.findAll();
        model.addAttribute("workerList", workers);

        List<Department> departments = departmentService.findAll();
        model.addAttribute("departmentList", departments);

        return "worker";
    }

    @PostMapping("/saveOrUpdate")
    public String saveOrUpdateWorker(@RequestParam(value = "idWorker", required = false) Long idWorker,
                              @RequestParam(value = "name") String name,
                              @RequestParam(value = "position") String position,
                              @RequestParam(value = "workposition") String workposition,
                              @RequestParam(value = "idDepartment", required = false) Long idDepartment){

        if (name.matches("^-?\\d+$") || position.matches("^-?\\d+$")) {
            throw new InputFormanException("Invalid input");
        }

        Worker worker = new Worker();
        worker.setIdWorker(idWorker);
        worker.setName(name);
        worker.setPosition(position);
        worker.setWorkposition(workposition);
        if (idDepartment != null){
            Department department = departmentService.findById(idDepartment);
            if (department != null) {
                worker.setDepartmentByIdDepartment(department);
            }else {
                throw new RuntimeException("eeee");
            }
        }
        workerService.saveOrUpdate(worker);
        return "redirect:/worker";
    }

    @PostMapping("/removeWorker")
    public String removeWorker(@RequestParam("idWorker") Long idWorker){
        Worker worker = workerService.findById(idWorker);
        if (worker != null){
            workerService.delete(worker);
        }
        return "redirect:/worker";
    }

    @GetMapping("/editWorker/{idWorker}")
    public String editWorker(@PathVariable("idWorker") Worker worker, Model model){
        model.addAttribute("editWorker", worker);
        return "workerEdit";
    }
}
