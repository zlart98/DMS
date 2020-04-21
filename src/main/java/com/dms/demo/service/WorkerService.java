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
public class WorkerService {

    @Autowired
    private DepartmentRepo departmentRepo;

    @Autowired
    private WorkerRepo workerRepo;

    public List<Worker> findAll() {
        return workerRepo.findAll();
    }

    public Worker findById(Long idWorker) {
        return workerRepo.findById(idWorker).orElseThrow(()
                -> new EntityNotFoundException("Worker with id = " + idWorker + " not found"));

    }

    public Worker findByIdWithWork(Long idWorker) {
        Worker worker = findById(idWorker);
        Department department = worker.getDepartmentByIdDepartment();
        Hibernate.initialize(department);
        return worker;
    }

    public void delete(Worker worker) {
        workerRepo.delete(worker);

    }

    public void saveOrUpdate(Worker worker) {
        workerRepo.saveAndFlush(worker);

    }

}



