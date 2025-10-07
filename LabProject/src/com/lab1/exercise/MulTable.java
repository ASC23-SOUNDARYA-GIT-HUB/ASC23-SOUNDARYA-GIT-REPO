package com.lab1.exercise;

public class MulTable {

        public static void printTableForLoop(int number) {
            System.out.println("Multiplication Table using for loop:");
            for (int i = 1; i <= 10; i++) {
                System.out.println(number + " x " + i + " = " + (number * i));
            }
        }

        public static void printTableWhileLoop(int number) {
            System.out.println("\nMultiplication Table using while loop:");
            int i = 1;
            while (i <= 10) {
                System.out.println(number + " x " + i + " = " + (number * i));
                i++;
            }
        }

        public static void printTableDoWhileLoop(int number) {
            System.out.println("\nMultiplication Table using do-while loop:");
            int i = 1;
            do {
                System.out.println(number + " x " + i + " = " + (number * i));
                i++;
            } while (i <= 10);
        }

        public static void main(String[] args) {
            int input = 2; // Example input
            printTableForLoop(input);
            printTableWhileLoop(input);
            printTableDoWhileLoop(input);
        }

}
