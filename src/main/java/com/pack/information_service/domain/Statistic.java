package com.pack.information_service.domain;

public class Statistic {
    private User user;
    private int yearCount;
    private double yearMark;
    private int monthCount;
    private double monthMark;

    public Statistic(User user, int yearCount, double yearMark, int monthCount, double monthMark) {
        this.user = user;
        this.yearCount = yearCount;
        this.yearMark = Math.round(yearMark * 100) / 100.d;
        this.monthCount = monthCount;
        this.monthMark = Math.round(monthMark * 100) / 100.d;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getYearCount() {
        return yearCount;
    }

    public void setYearCount(int yearCount) {
        this.yearCount = yearCount;
    }

    public double getYearMark() {
        return yearMark;
    }

    public void setYearMark(double yearMark) {
        this.yearMark = yearMark;
    }

    public int getMonthCount() {
        return monthCount;
    }

    public void setMonthCount(int monthCount) {
        this.monthCount = monthCount;
    }

    public double getMonthMark() {
        return monthMark;
    }

    public void setMonthMark(double monthMark) {
        this.monthMark = monthMark;
    }
}
