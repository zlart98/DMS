package com.dms.demo.domain;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;

@Entity
@Table(name = "worker", schema = "new_schema")
public class Worker {
    private Long idWorker;
    private String name;
    private String position;
    private String workposition;
    private Department departmentByIdDepartment;

    @Id
    @GeneratedValue(generator = "increment")
    @GenericGenerator(name = "increment", strategy = "increment")
    @Column(name = "idWorker")
    public Long getIdWorker() {
        return idWorker;
    }

    public void setIdWorker(Long idWorker) {
        this.idWorker = idWorker;
    }

    @Basic
    @Column(name = "name")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "position")
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    @Basic
    @Column(name = "workposition")
    public String getWorkposition() {
        return workposition;
    }

    public void setWorkposition(String workposition) {
        this.workposition = workposition;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        Worker that = (Worker) o;

        if (idWorker != that.idWorker) return false;
        if (name != null ? !name.equals(that.name) : that.name != null) return false;
        if (position != null ? !position.equals(that.position) : that.position != null) return false;
        if (workposition != null ? !workposition.equals(that.workposition) : that.workposition != null) return false;

        return true;
    }

    @Override
    public int hashCode() {
        return super.hashCode();
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idDepartment", referencedColumnName = "idDepartment")
    public Department getDepartmentByIdDepartment() {
        return departmentByIdDepartment;
    }

    public void setDepartmentByIdDepartment(Department departmentByIdDepartment) {
        this.departmentByIdDepartment = departmentByIdDepartment;
    }
}
