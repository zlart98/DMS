package com.dms.demo.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "department", schema = "new_schema")
public class Department {
    private Long idDepartment;
    private String departmentName;
    private List<Worker> workersByIdDepartment;

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "idDepartment")
    public Long getIdDepartment() {
        return idDepartment;
    }

    public void setIdDepartment(Long idDepartment) {
        this.idDepartment = idDepartment;
    }

    @Basic
    @Column(name = "departmentName")
    public String getDepartmentName() {
        return departmentName;
    }

    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Department that = (Department) o;

        if (idDepartment != that.idDepartment) return false;
        if (departmentName != null ? !departmentName.equals(that.departmentName) : that.departmentName != null)
            return false;

        return true;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @OneToMany(mappedBy = "departmentByIdDepartment", fetch = FetchType.LAZY)
    public List<com.dms.demo.domain.Worker> getWorkersByIdDepartment() {
        return workersByIdDepartment;
    }

    public void setWorkersByIdDepartment(List<Worker> workersByIdDepartment) {
        this.workersByIdDepartment = workersByIdDepartment;
    }
}
