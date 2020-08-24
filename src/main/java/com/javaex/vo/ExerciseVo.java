package com.javaex.vo;

public class ExerciseVo {
    private int exNo, trainerNo, exPartNo;
    private String exName, exPartName, amount;

    public ExerciseVo() {
    }

    public ExerciseVo(int exNo, int trainerNo, int exPartNo, String exName, String exPartName, String amount) {
        this.exNo = exNo;
        this.trainerNo = trainerNo;
        this.exPartNo = exPartNo;
        this.exName = exName;
        this.exPartName = exPartName;
        this.amount = amount;
    }

    public int getExNo() {
        return exNo;
    }

    public void setExNo(int exNo) {
        this.exNo = exNo;
    }

    public int getTrainerNo() {
        return trainerNo;
    }

    public void setTrainerNo(int trainerNo) {
        this.trainerNo = trainerNo;
    }

    public int getExPartNo() {
        return exPartNo;
    }

    public void setExPartNo(int exPartNo) {
        this.exPartNo = exPartNo;
    }

    public String getExName() {
        return exName;
    }

    public void setExName(String exName) {
        this.exName = exName;
    }

    public String getExPartName() {
        return exPartName;
    }

    public void setExPartName(String exPartName) {
        this.exPartName = exPartName;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    @Override
    public String toString() {
        return "ExerciseVo{" +
                "exNo=" + exNo +
                ", trainerNo=" + trainerNo +
                ", exPartNo=" + exPartNo +
                ", exName='" + exName + '\'' +
                ", exPartName='" + exPartName + '\'' +
                ", amount='" + amount + '\'' +
                '}';
    }
}
