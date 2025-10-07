package com.lab3.exercise;

public class MovieClass {

        public static void main(String[] args) {
            Movie m1 = new Movie("Hello", "XYZ Productions");
            System.out.println(m1.getMovieId());

            Movie m2 = new Movie("ActionBlast", "ABC Studios", "John Doe", 120, 2023, "Action");
            System.out.println("\n--- Movie Details ---");
            System.out.println(m2.showDetails());

            SpecialMovie sm = new SpecialMovie("EpicSound", "SoundWorks", "Jane Smith", 150, 2024, "Sci-Fi", "Dolby Atmos", "CGI Pro");
            System.out.println("\n--- Special Movie Details ---");
            System.out.println(sm.showSpecialDetails());

            InternationalMovie im = new InternationalMovie("GlobalHit", "WorldWide Films", "Lee Chan", 130, 2022, "Drama", "South Korea", "Korean");
            System.out.println("\n--- International Movie Details ---");
            System.out.println(im.showInternationalDetails());

            System.out.println("\nTotal Movies Created: " + Movie.getMoviesCount());
        }
}

    class Movie {
        private String movieName;
        private String producedBy;
        private String directedBy;
        private int duration;
        private int year;
        private String category;

        private final String movieId;
        private static int moviesCount = 0;

        public Movie(String movieName, String producedBy) {
            if (movieName == null || producedBy == null) {
                throw new IllegalArgumentException("movieName and producedBy are mandatory.");
            }
            this.movieName = movieName;
            this.producedBy = producedBy;
            moviesCount++;
            this.movieId = movieName + "_" + moviesCount;
        }

        public Movie(String movieName, String producedBy, String directedBy, int duration, int year, String category) {
            this(movieName, producedBy);
            this.directedBy = directedBy;
            this.duration = duration;
            this.year = year;
            this.category = category;
        }

        public String getMovieId() {
            return movieId;
        }

        public static int getMoviesCount() {
            return moviesCount;
        }

        public String showDetails() {
            return "Movie ID: " + movieId +
                    "\nName: " + movieName +
                    "\nProduced By: " + producedBy +
                    "\nDirected By: " + directedBy +
                    "\nDuration: " + duration +
                    "\nYear: " + year +
                    "\nCategory: " + category;
        }
    }

    // SpecialMovie class
    class SpecialMovie extends Movie {
        private String soundEffectsTechnology;
        private String visualEffectsTechnology;

        public SpecialMovie(String movieName, String producedBy, String directedBy, int duration, int year, String category,
                            String soundEffectsTechnology, String visualEffectsTechnology) {
            super(movieName, producedBy, directedBy, duration, year, category);
            this.soundEffectsTechnology = soundEffectsTechnology;
            this.visualEffectsTechnology = visualEffectsTechnology;
        }

        public String showSpecialDetails() {
            return showDetails() +
                    "\nSound Effects: " + soundEffectsTechnology +
                    "\nVisual Effects: " + visualEffectsTechnology;
        }
    }

    class InternationalMovie extends Movie {
        private String country;
        private String language;

        public InternationalMovie(String movieName, String producedBy, String directedBy, int duration, int year, String category,
                                  String country, String language) {
            super(movieName, producedBy, directedBy, duration, year, category);
            this.country = country;
            this.language = language;
        }

        public String showInternationalDetails() {
            return showDetails() +
                    "\nCountry: " + country +
                    "\nLanguage: " + language;
        }

}