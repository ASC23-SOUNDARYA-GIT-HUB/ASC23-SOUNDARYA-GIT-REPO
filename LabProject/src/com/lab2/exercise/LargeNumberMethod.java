package com.lab2.exercise;

public class LargeNumberMethod {

        public static int largest(int a, int b, int c) {
            return Math.max(a, Math.max(b, c));
        }

        public static void main(String[] args) {
            int num1 = 45;
            int num2 = 78;
            int num3 = 32;

            int largestNum = largest(num1, num2, num3);
            System.out.println("The largest number is: " + largestNum);
        }

}
