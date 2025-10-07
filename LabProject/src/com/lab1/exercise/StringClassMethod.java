package com.lab1.exercise;

public class StringClassMethod {


        public static void main(String[] args) {
            String str = "  Hello World from Java  ";
            String str2 = "hello world from java";

            // charAt
            System.out.println("charAt(6): " + str.charAt(6));

            // contains
            System.out.println("contains(\"World\"): " + str.contains("World"));

            // length
            System.out.println("length(): " + str.length());

            // indexOf
            System.out.println("indexOf(\"Java\"): " + str.indexOf("Java"));

            // equals
            System.out.println("equals(str2): " + str.equals(str2));

            // equalsIgnoreCase
            System.out.println("equalsIgnoreCase(str2): " + str.trim().equalsIgnoreCase(str2.trim()));

            // join
            String joined = String.join(" - ", "Java", "Python", "C++");
            System.out.println("join(): " + joined);

            // lastIndexOf
            System.out.println("lastIndexOf(\"o\"): " + str.lastIndexOf("o"));

            // substring
            System.out.println("substring(2, 7): " + str.substring(2, 7));

            // toLowerCase
            System.out.println("toLowerCase(): " + str.toLowerCase());

            // toUpperCase
            System.out.println("toUpperCase(): " + str.toUpperCase());

            // trim
            System.out.println("trim(): \"" + str.trim() + "\"");
        }

}
