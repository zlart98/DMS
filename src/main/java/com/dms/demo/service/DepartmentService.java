package com.dms.demo.service;

import com.dms.demo.domain.Department;
import com.dms.demo.domain.Worker;
import com.dms.demo.service.dao.DepartmentRepo;
import com.dms.demo.service.dao.WorkerRepo;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.persistence.EntityNotFoundException;
import java.util.List;

@Service
public class DepartmentService {

    @Autowired
    private DepartmentRepo departmentRepo;

    @Autowired
    private WorkerService workerService;

    public List<Department> findAll(){
        return departmentRepo.findAll();
    }

    public Department findById(Long idDepartment){
        return departmentRepo.findById(idDepartment).orElseThrow(()
                -> new EntityNotFoundException("Department with id = " + idDepartment + " not found"));
    }

    public void saveOrUpdate(Department department) {
        departmentRepo.saveAndFlush(department);
    }

    public Department findByIdWithDeps(Long idDepartment){
        Department department = findById(idDepartment);
        department.getWorkersByIdDepartment();
        return department;
    }

    public void removeWorkerFromDepartment(Worker worker) {
        worker.setDepartmentByIdDepartment(null);
        workerService.saveOrUpdate(worker);
    }

    public void delete(Department department) {
        Department departmentEntity = findByIdWithDeps(department.getIdDepartment());
            List<Worker> workerListFromDepartment = departmentEntity.getWorkersByIdDepartment();
            if (workerListFromDepartment != null) {
                for (Worker w : workerListFromDepartment) {
                    removeWorkerFromDepartment(w);
                }
            }
            departmentRepo.delete(department);
    }

    public void addWorkerInDepartment(Worker worker) {
            Worker workerEntity = workerService.findByIdWithWork(worker.getIdWorker());
            Hibernate.initialize(workerEntity);
            workerEntity.setDepartmentByIdDepartment(worker.getDepartmentByIdDepartment());
            workerService.saveOrUpdate(worker);

    }

    public List<Worker> getWorkerWithoutDepartment(){
        return departmentRepo.getWorkerWithoutDepartment();
    }
}
