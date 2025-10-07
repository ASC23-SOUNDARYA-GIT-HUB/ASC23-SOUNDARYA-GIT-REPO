package com.lab1.exercise;

public class wordCount {


        public static int countWords(String input) {
            if (input == null || input.trim().isEmpty()) {
                return 0;
            }


            String[] words = input.trim().split("\\s+");
            return words.length;
        }

        public static void main(String[] args) {
            String sentence = "Soundarya working as a Developer";
            int wordCount = countWords(sentence);
            System.out.println("Word Count: " + wordCount);
        }


}
