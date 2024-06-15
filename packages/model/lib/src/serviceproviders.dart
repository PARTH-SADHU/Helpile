class ServiceProvider {
  final String name;
  final String description;
  final String imageUrl;
  final List<String> services;
  final double rating;
  final double charges;
  final double distance; // Distance from the user in kilometers or miles

  ServiceProvider({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.services,
    required this.rating,
    required this.charges,
    required this.distance, // Initialize distance
  });
}

// Dummy data for nearby service providers
List<ServiceProvider> ServiceProvidersList = [
  ServiceProvider(
    name: "John's Plumbing Services",
    description: "Providing plumbing services for residential and commercial properties.",
    imageUrl: "https://example.com/john_plumbing.jpg",
    services: ["Pipe Repair", "Drain Cleaning", "Fixture Installation"],
    rating: 4.5,
    charges: 50.0,
    distance: 1.2,
  ),
  ServiceProvider(
    name: "Bright Spark Electricians",
    description: "Expert electricians for all your electrical needs.",
    imageUrl: "https://example.com/bright_spark.jpg",
    services: ["Wiring", "Lighting Installation", "Electrical Repairs"],
    rating: 4.2,
    charges: 80.0,
    distance: 2.5,
  ),
  ServiceProvider(
    name: "Fresh Clean Janitorial Services",
    description: "Professional cleaning services for homes and offices.",
    imageUrl: "https://example.com/fresh_clean.jpg",
    services: ["Office Cleaning", "Housekeeping", "Carpet Cleaning"],
    rating: 4.8,
    charges: 100.0,
    distance: 0.8,
  ),
  ServiceProvider(
    name: "Healthy Lawn Care",
    description: "Complete lawn care services for residential properties.",
    imageUrl: "https://example.com/healthy_lawn.jpg",
    services: ["Lawn Mowing", "Fertilization", "Weed Control"],
    rating: 4.6,
    charges: 60.0,
    distance: 1.5,
  ),
  ServiceProvider(
    name: "Sparkling Windows",
    description: "Professional window cleaning for homes and offices.",
    imageUrl: "https://example.com/sparkling_windows.jpg",
    services: ["Interior Window Cleaning", "Exterior Window Cleaning"],
    rating: 4.4,
    charges: 70.0,
    distance: 3.0,
  ),
  ServiceProvider(
    name: "Quick Fix Handyman",
    description: "General handyman services for small repairs and installations.",
    imageUrl: "https://example.com/quick_fix.jpg",
    services: ["Furniture Assembly", "Minor Repairs", "TV Mounting"],
    rating: 4.7,
    charges: 55.0,
    distance: 1.0,
  ),
  ServiceProvider(
    name: "Cozy Home Cleaning",
    description: "Reliable and affordable home cleaning services.",
    imageUrl: "https://example.com/cozy_home.jpg",
    services: ["Regular Cleaning", "Deep Cleaning", "Move-in/Move-out Cleaning"],
    rating: 4.3,
    charges: 75.0,
    distance: 2.2,
  ),
  ServiceProvider(
    name: "Safe Lock Locksmith",
    description: "Emergency and scheduled locksmith services.",
    imageUrl: "https://example.com/safe_lock.jpg",
    services: ["Lock Installation", "Key Duplication", "Emergency Lockout"],
    rating: 4.5,
    charges: 90.0,
    distance: 3.5,
  ),
  ServiceProvider(
    name: "Cool Breeze HVAC",
    description: "Heating, ventilation, and air conditioning services.",
    imageUrl: "https://example.com/cool_breeze.jpg",
    services: ["AC Repair", "Heater Installation", "Duct Cleaning"],
    rating: 4.6,
    charges: 120.0,
    distance: 4.0,
  ),
  ServiceProvider(
    name: "Top Notch Landscaping",
    description: "Landscaping services for beautiful outdoor spaces.",
    imageUrl: "https://example.com/top_notch.jpg",
    services: ["Garden Design", "Lawn Care", "Tree Trimming"],
    rating: 4.8,
    charges: 110.0,
    distance: 2.7,
  ),

ServiceProvider(
    name: "John's Plumbing Services",
    description: "Providing plumbing services for residential and commercial properties.",
    imageUrl: "https://example.com/john_plumbing.jpg",
    services: ["Pipe Repair", "Drain Cleaning", "Fixture Installation"],
    rating: 4.5,
    charges: 50.0,
    distance: 1.2, // Distance in kilometers or miles
  ),
  ServiceProvider(
    name: "Bright Spark Electricians",
    description: "Expert electricians for all your electrical needs.",
    imageUrl: "https://example.com/bright_spark.jpg",
    services: ["Wiring", "Lighting Installation", "Electrical Repairs"],
    rating: 4.2,
    charges: 80.0,
    distance: 2.5, // Distance in kilometers or miles
  ),
  ServiceProvider(
    name: "Fresh Clean Janitorial Services",
    description: "Professional cleaning services for homes and offices.",
    imageUrl: "https://example.com/fresh_clean.jpg",
    services: ["Office Cleaning", "Housekeeping", "Carpet Cleaning"],
    rating: 4.8,
    charges: 100.0,
    distance: 0.8, // Distance in kilometers or miles
  ),
];
