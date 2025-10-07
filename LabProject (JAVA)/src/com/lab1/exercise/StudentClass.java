package com.lab1.exercise;

public class StudentClass {
    private int studentId;
    private String studentName;
    private String city;
    private int marks1;
    private int marks2;
    private int marks3;
    private float feePerMonth;
    private boolean isEligibleForScholarship;

    // Setter methods
    public void setStudentId(int studentId) { this.studentId = studentId; }
    public void setStudentName(String studentName) { this.studentName = studentName; }
    public void setCity(String city) { this.city = city; }
    public void setMarks1(int marks1) { this.marks1 = marks1; }
    public void setMarks2(int marks2) { this.marks2 = marks2; }
    public void setMarks3(int marks3) { this.marks3 = marks3; }
    public void setFeePerMonth(float feePerMonth) { this.feePerMonth = feePerMonth; }
    public void setIsEligibleForScholarship(boolean isEligibleForScholarship) {
        this.isEligibleForScholarship = isEligibleForScholarship;
    }

    // Getter methods
    public int getStudentId() { return studentId; }
    public String getStudentName() { return studentName; }
    public String getCity() { return city; }
    public int getMarks1() { return marks1; }
    public int getMarks2() { return marks2; }
    public int getMarks3() { return marks3; }
    public float getFeePerMonth() { return feePerMonth; }
    public boolean getIsEligibleForScholarship() { return isEligibleForScholarship; }

    // Business logic methods
    public float getAnnualFee() {
        return feePerMonth * 12;
    }

    public int getTotalMarks() {
        return marks1 + marks2 + marks3;
    }

    public float getAverage() {
        return getTotalMarks() / 3.0f;
    }

    public String getResult() {
        return (marks1 > 60 && marks2 > 60 && marks3 > 60) ? "pass" : "fail";
    }



    public static void main(String[] args) {
        // Create and populate student objects
        StudentClass s1 = new StudentClass();
        s1.setStudentId(1);
        s1.setStudentName("Arya");
        s1.setCity("Chennai");
        s1.setMarks1(85);
        s1.setMarks2(90);
        s1.setMarks3(88);
        s1.setFeePerMonth(1500.0f);
        s1.setIsEligibleForScholarship(true);

        StudentClass s2 = new StudentClass();
        s2.setStudentId(2);
        s2.setStudentName("Sound");
        s2.setCity("Mumbai");
        s2.setMarks1(70);
        s2.setMarks2(65);
        s2.setMarks3(72);
        s2.setFeePerMonth(1200.0f);
        s2.setIsEligibleForScholarship(false);

        StudentClass s3 = new StudentClass();
        s3.setStudentId(3);
        s3.setStudentName("Sneha");
        s3.setCity("Delhi");
        s3.setMarks1(60);
        s3.setMarks2(58);
        s3.setMarks3(62);
        s3.setFeePerMonth(1000.0f);
        s3.setIsEligibleForScholarship(false);

        // Find student with highest total marks
        StudentClass topStudent = s1;
        if (s2.getTotalMarks() > topStudent.getTotalMarks()) topStudent = s2;
        if (s3.getTotalMarks() > topStudent.getTotalMarks()) topStudent = s3;
        System.out.println("Student with highest total marks: " + topStudent.getStudentName());

        // Find student with least monthly fee
        StudentClass leastFeeStudent = s1;
        if (s2.getFeePerMonth() < leastFeeStudent.getFeePerMonth()) leastFeeStudent = s2;
        if (s3.getFeePerMonth() < leastFeeStudent.getFeePerMonth()) leastFeeStudent = s3;
        System.out.println("Student with least monthly fee: " + leastFeeStudent.getStudentName() +
                ", Fee: " + leastFeeStudent.getFeePerMonth());

        // Print details for every student
        StudentClass[] students = {s1, s2, s3};
        for (StudentClass s : students) {
            System.out.println("\nName: " + s.getStudentName());
            System.out.println("Total Marks: " + s.getTotalMarks());
            System.out.println("Average Marks: " + s.getAverage());
            System.out.println("Result: " + s.getResult());
            System.out.println("Scholarship Status: " + (s.getIsEligibleForScholarship() ? "Eligible" : "Not Eligible"));
        }
    }
}