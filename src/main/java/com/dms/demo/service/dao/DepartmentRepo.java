package com.dms.demo.service.dao;

import com.dms.demo.domain.Department;
import com.dms.demo.domain.Worker;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface DepartmentRepo extends JpaRepository<Department, Long> {
    @Query("FROM Worker WHERE departmentByIdDepartment IS NULL")
    List<Worker> getWorkerWithoutDepartment();
}
