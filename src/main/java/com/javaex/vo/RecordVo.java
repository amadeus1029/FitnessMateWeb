package com.javaex.vo;

public class RecordVo {
    private int recordNo, scheduleNo, exNo, count, amount;
    private String exPart, exName;

    public RecordVo() {
    }

    public RecordVo(int recordNo, int scheduleNo, int exNo, int count, int amount, String exPart, String exName) {
        this.recordNo = recordNo;
        this.scheduleNo = scheduleNo;
        this.exNo = exNo;
        this.count = count;
        this.amount = amount;
        this.exPart = exPart;
        this.exName = exName;
    }

    public int getRecordNo() {
        return recordNo;
    }

    public void setRecordNo(int recordNo) {
        this.recordNo = recordNo;
    }

    public int getScheduleNo() {
        return scheduleNo;
    }

    public void setScheduleNo(int scheduleNo) {
        this.scheduleNo = scheduleNo;
    }

    public int getExNo() {
        return exNo;
    }

    public void setExNo(int exNo) {
        this.exNo = exNo;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getExPart() {
        return exPart;
    }

    public void setExPart(String exPart) {
        this.exPart = exPart;
    }

    public String getExName() {
        return exName;
    }

    public void setExName(String exName) {
        this.exName = exName;
    }

    @Override
    public String toString() {
        return "RecordVo{" +
                "recordNo=" + recordNo +
                ", scheduleNo=" + scheduleNo +
                ", exNo=" + exNo +
                ", count=" + count +
                ", amount=" + amount +
                ", exPart='" + exPart + '\'' +
                ", exName='" + exName + '\'' +
                '}';
    }
}