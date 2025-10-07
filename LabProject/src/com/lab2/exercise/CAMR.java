package com.lab2.exercise;
import java.util.*;

import java.util.*;

class MeetingRoom {
    String roomId;
    int capacity;
    int floorLocation;
    boolean hasZoomFacility;

    public MeetingRoom(String roomId, int capacity, int floorLocation, boolean hasZoomFacility) {
        this.roomId = roomId;
        this.capacity = capacity;
        this.floorLocation = floorLocation;
        this.hasZoomFacility = hasZoomFacility;
    }

    public String getDetails() {
        return "Room ID: " + roomId + ", Capacity: " + capacity + ", Floor: " + floorLocation +
                ", Zoom Facility: " + hasZoomFacility;
    }
}

class ZoomMeetingRoom extends MeetingRoom {
    String zoomDeviceId;
    String zoomAccountId;

    public ZoomMeetingRoom(String roomId, int capacity, int floorLocation, String zoomDeviceId, String zoomAccountId) {
        super(roomId, capacity, floorLocation, true);
        this.zoomDeviceId = zoomDeviceId;
        this.zoomAccountId = zoomAccountId;
    }

    @Override
    public String getDetails() {
        return super.getDetails() + ", Zoom Device ID: " + zoomDeviceId + ", Zoom Account ID: " + zoomAccountId;
    }
}

class Employee {
    String employeeId;

    public Employee(String employeeId) {
        this.employeeId = employeeId;
    }
}

class Booking {
    String bookingId;
    Employee employee;
    MeetingRoom room;
    String date;
    String time;
    int duration;

    public Booking(String bookingId, Employee employee, MeetingRoom room, String date, String time, int duration) {
        this.bookingId = bookingId;
        this.employee = employee;
        this.room = room;
        this.date = date;
        this.time = time;
        this.duration = duration;
    }

    public String getBookingDetails() {
        return "Booking ID: " + bookingId + ", Employee ID: " + employee.employeeId +
                ", Room ID: " + room.roomId + ", Date: " + date + ", Time: " + time +
                ", Duration: " + duration + " mins";
    }
}

class BookingManager {
    List<Booking> bookings = new ArrayList<>();

    public void createBooking(Booking booking) {
        bookings.add(booking);
    }

    public List<Booking> getBookingsByDate(String date) {
        List<Booking> result = new ArrayList<>();
        for (Booking b : bookings) {
            if (b.date.equals(date)) {
                result.add(b);
            }
        }
        return result;
    }
}

public class CAMR {
    public static void main(String[] args) {
        MeetingRoom room1 = new MeetingRoom("MR101", 10, 2, false);
        ZoomMeetingRoom room2 = new ZoomMeetingRoom("MR102", 8, 3, "ZD001", "ZA001");

        Employee emp1 = new Employee("E001");

        BookingManager manager = new BookingManager();

        Booking booking1 = new Booking("B001", emp1, room1, "2025-10-01", "10:00", 60);
        Booking booking2 = new Booking("B002", emp1, room2, "2025-10-01", "11:00", 30);

        manager.createBooking(booking1);
        manager.createBooking(booking2);

        List<Booking> bookings = manager.getBookingsByDate("2025-10-01");
        for (Booking b : bookings) {
            System.out.println(b.getBookingDetails());
        }
    }
}