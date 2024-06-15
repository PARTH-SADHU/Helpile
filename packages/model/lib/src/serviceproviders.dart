class ServiceProvider {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> services;
  final double rating;
  final double charges; // New property for charges

  ServiceProvider({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.services,
    required this.rating,
    required this.charges, // Initialize charges
  });
}

// Dummy data for service providers
List<ServiceProvider> ServiceProvidersList = [
  ServiceProvider(
    name: "John's Plumbing Services",
    description: "Providing plumbing services for residential and commercial properties.",
    imageUrl: "https://example.com/john_plumbing.jpg",
    services: ["Pipe Repair", "Drain Cleaning", "Fixture Installation"],
    rating: 4.5,
    charges: 50.0, // Set charges
  ),
  ServiceProvider(
    name: "Bright Spark Electricians",
    description: "Expert electricians for all your electrical needs.",
    imageUrl: "https://example.com/bright_spark.jpg",
    services: ["Wiring", "Lighting Installation", "Electrical Repairs"],
    rating: 4.2,
    charges: 80.0, // Set charges
  ),
  ServiceProvider(
    name: "Fresh Clean Janitorial Services",
    description: "Professional cleaning services for homes and offices.",
    imageUrl: "https://example.com/fresh_clean.jpg",
    services: ["Office Cleaning", "Housekeeping", "Carpet Cleaning"],
    rating: 4.8,
    charges: 100.0, // Set charges
  ),
];
