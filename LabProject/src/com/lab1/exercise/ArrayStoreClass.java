package com.lab1.exercise;

import java.util.*;
public class ArrayStoreClass {

        private int[] arr = new int[10];


        public void acceptElements(Scanner sc) {
            System.out.println("Enter 10 integers:");
            for (int i = 0; i < 10; i++) {
                arr[i] = sc.nextInt();
            }
        }


        public void displayWhile() {
            int i = 0;
            System.out.print("Array (while loop): ");
            while (i < arr.length) {
                System.out.print(arr[i] + " ");
                i++;
            }
            System.out.println();
        }

        public void displayFor() {
            System.out.print("Array (for loop): ");
            for (int num : arr) {
                System.out.print(num + " ");
            }
            System.out.println();
        }


        public void sortArray() {
            Arrays.sort(arr);
            System.out.println("Sorted array: " + Arrays.toString(arr));
        }

        public int countOccurrences(int number) {
            int count = 0;
            for (int num : arr) {
                if (num == number) count++;
            }
            return count;
        }

        public void insertAtPosition(int number, int position) {
            if (position < 0 || position > arr.length) {
                System.out.println("Invalid position.");
                return;
            }

            int[] newArr = new int[arr.length + 1];
            for (int i = 0; i < position; i++) {
                newArr[i] = arr[i];
            }
            newArr[position] = number;
            for (int i = position; i < arr.length; i++) {
                newArr[i + 1] = arr[i];
            }

            arr = newArr;
            System.out.println("Array after insertion: " + Arrays.toString(arr));
        }

        public int[] removeDuplicates() {
            Set<Integer> set = new LinkedHashSet<>();
            for (int num : arr) {
                set.add(num);
            }

            int[] uniqueArr = new int[set.size()];
            int i = 0;
            for (int num : set) {
                uniqueArr[i++] = num;
            }

            return uniqueArr;
        }


        public void printArray(int[] array) {
            System.out.println(Arrays.toString(array));
        }

        // Main method for testing
        public static void main(String[] args) {
            Scanner sc = new Scanner(System.in);
            ArrayStoreClass store = new ArrayStoreClass();

            store.acceptElements(sc);
            store.displayWhile();
            store.displayFor();
            store.sortArray();

            System.out.print("Enter number to count: ");
            int numToCount = sc.nextInt();
            System.out.println("Occurrences of " + numToCount + ": " + store.countOccurrences(numToCount));

            System.out.print("Enter number to insert: ");
            int numToInsert = sc.nextInt();
            System.out.print("Enter position to insert at: ");
            int position = sc.nextInt();
            store.insertAtPosition(numToInsert, position);

            System.out.println("Array without duplicates:");
            store.printArray(store.removeDuplicates());

            sc.close();
        }

}
