package com.lab2.exercise;

public class WelcomeMethod {


        public static String welcomeMessage(String name) {

            return "Hello " + name + ", Welcome to Java World!";
        }

        public static void main(String[] args) {
            String name = "Soundarya";
            String message = welcomeMessage(name);
            System.out.println(message);
        }

}
