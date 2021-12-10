package com.ute.dbms.webshop.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.Date;
import java.util.List;


@Entity
@Table(name = "BILL")
public class Bill {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "ID_BILL")
    private int id;

    @ManyToOne
    @JoinColumn(name = "ID_USER")
    private User user;

    @Column(name = "DATE", nullable = false)
    private Date date;

    @Column(name = "SUM", nullable = false)
    private int sum;

    @OneToMany(mappedBy = "bill", cascade = CascadeType.ALL)
    @PrimaryKeyJoinColumn
    private List<Detail> detail;

    @Column(name = "STATUS")
    private boolean status;

    public Bill() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getSum() {
        return sum;
    }

    public void setSum(int sum) {
        this.sum = sum;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public List<Detail> getDetail() {
        return detail;
    }

    public void setDetail(List<Detail> detail) {
        this.detail = detail;
    }
}