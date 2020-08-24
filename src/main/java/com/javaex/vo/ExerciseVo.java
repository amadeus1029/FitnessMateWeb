package com.javaex.vo;

public class ExerciseVo {
    private int exNo, trainerNo;
    private String exName, exPart, amount;

    public ExerciseVo() {
    }

    public ExerciseVo(int exNo, int trainerNo, String exName, String exPart, String amount) {
        this.exNo = exNo;
        this.trainerNo = trainerNo;
        this.exName = exName;
        this.exPart = exPart;
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

    public String getExName() {
        return exName;
    }

    public void setExName(String exName) {
        this.exName = exName;
    }

    public String getExPart() {
        return exPart;
    }

    public void setExPart(String exPart) {
        this.exPart = exPart;
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
                ", exName='" + exName + '\'' +
                ", exPart='" + exPart + '\'' +
                ", amount='" + amount + '\'' +
                '}';
    }
}
