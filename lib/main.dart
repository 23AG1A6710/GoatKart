import 'package:flutter/material.dart';

void main() {
  runApp(const GoatKartApp());
}

// ============================================================
// GOATKART APP
// ============================================================

class GoatKartApp extends StatelessWidget {
  const GoatKartApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GoatKart',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: bgColor,

        colorScheme: const ColorScheme.dark(
          primary: primaryGreen,
          secondary: goldColor,
          surface: cardColor,
        ),

        appBarTheme: const AppBarTheme(
          backgroundColor: bgColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),

        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: inputColor,
          labelStyle: TextStyle(
            color: Colors.white70,
          ),
          hintStyle: TextStyle(
            color: Colors.white38,
          ),
          prefixIconColor: primaryGreen,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            borderSide: BorderSide.none,
          ),
        ),

        bottomNavigationBarTheme:
            const BottomNavigationBarThemeData(
          backgroundColor: cardColor,
          selectedItemColor: primaryGreen,
          unselectedItemColor: Colors.white38,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      home: const AuthScreen(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

const Color bgColor = Color(0xFF0B0F0D);
const Color cardColor = Color(0xFF151A17);
const Color cardColor2 = Color(0xFF1B211D);
const Color inputColor = Color(0xFF202621);

const Color primaryGreen = Color(0xFF35A866);
const Color darkGreen = Color(0xFF176B3A);
const Color lightGreen = Color(0xFF75D89B);

const Color goldColor = Color(0xFFD9A441);
const Color creamColor = Color(0xFFF4EBDD);

const Color accentRed = Color(0xFFE53935);

// ============================================================
// AUTH SCREEN
// ============================================================

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isLogin = true;
  bool obscurePassword = true;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void continueToApp() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 450,
              ),
              child: Column(
                children: [
                  Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          primaryGreen,
                          darkGreen,
                        ],
                      ),
                      borderRadius:
                          BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color:
                              primaryGreen.withOpacity(0.30),
                          blurRadius: 30,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.restaurant,
                      color: Colors.white,
                      size: 52,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'GoatKart',
                    style: TextStyle(
                      color: creamColor,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'FRESH MUTTON • FRESH CUTS • FAST DELIVERY',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: goldColor,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 35),

                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius:
                          BorderRadius.circular(26),
                      border: Border.all(
                        color:
                            Colors.white.withOpacity(0.06),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color:
                              Colors.black.withOpacity(0.35),
                          blurRadius: 25,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          isLogin
                              ? 'Welcome Back 👋'
                              : 'Create Account',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 7),

                        Text(
                          isLogin
                              ? 'Login to order fresh mutton.'
                              : 'Create your GoatKart account.',
                          style: const TextStyle(
                            color: Colors.white54,
                          ),
                        ),

                        const SizedBox(height: 25),

                        if (!isLogin) ...[
                          authField(
                            controller: nameController,
                            label: 'Full Name',
                            icon:
                                Icons.person_outline,
                          ),
                          const SizedBox(height: 15),
                        ],

                        authField(
                          controller: emailController,
                          label: 'Email Address',
                          icon:
                              Icons.email_outlined,
                        ),

                        const SizedBox(height: 15),

                        authField(
                          controller:
                              passwordController,
                          label: 'Password',
                          icon: Icons.lock_outline,
                          obscureText:
                              obscurePassword,
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                obscurePassword =
                                    !obscurePassword;
                              });
                            },
                            icon: Icon(
                              obscurePassword
                                  ? Icons
                                      .visibility_outlined
                                  : Icons
                                      .visibility_off_outlined,
                              color: Colors.white54,
                            ),
                          ),
                        ),

                        if (!isLogin) ...[
                          const SizedBox(height: 15),
                          authField(
                            controller:
                                phoneController,
                            label: 'Phone Number',
                            icon:
                                Icons.phone_outlined,
                            keyboardType:
                                TextInputType.phone,
                          ),
                        ],

                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 54,
                          child: ElevatedButton(
                            onPressed: continueToApp,
                            style:
                                ElevatedButton.styleFrom(
                              backgroundColor:
                                  primaryGreen,
                              foregroundColor:
                                  Colors.white,
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                  16,
                                ),
                              ),
                            ),
                            child: Text(
                              isLogin
                                  ? 'LOGIN'
                                  : 'CREATE ACCOUNT',
                              style: const TextStyle(
                                fontWeight:
                                    FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 18),

                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Colors.white12,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets
                                      .symmetric(
                                horizontal: 12,
                              ),
                              child: Text(
                                'OR',
                                style: TextStyle(
                                  color: Colors.white
                                      .withOpacity(0.4),
                                ),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: Colors.white12,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 18),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: OutlinedButton.icon(
                            onPressed: continueToApp,
                            icon: const Icon(
                              Icons.phone_android,
                            ),
                            label: const Text(
                              'Continue with Phone',
                            ),
                            style:
                                OutlinedButton.styleFrom(
                              foregroundColor:
                                  lightGreen,
                              side: const BorderSide(
                                color: primaryGreen,
                              ),
                              shape:
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                  15,
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 15),

                        Center(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Text(
                              isLogin
                                  ? 'New to GoatKart? Create Account'
                                  : 'Already have an account? Login',
                              style:
                                  const TextStyle(
                                color: lightGreen,
                                fontWeight:
                                    FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    'By continuing, you agree to GoatKart Terms & Privacy Policy.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget authField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    bool obscureText = false,
    Widget? suffixIcon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.white,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final TextEditingController searchController =
      TextEditingController();

  // ==========================================================
  // PRODUCT DATA
  // ==========================================================

  final List<Product> products = [
    Product(
      name: 'Biryani Cut',
      weight: '500 g',
      price: 399,
      rating: 4.8,
      imageUrl:
          'https://media-assets.swiggy.com/swiggy/image/upload/fl_lossy,f_auto,q_auto,w_600,h_468/DINEOUT_ALL_RESTAURANTS/IMAGES/RESTAURANT_IMAGE_SERVICE/2025/2/24/990d2b9f-bd06-4975-9353-8716afe3f7e8_image74857fef7ab394489b12f0ec036977f16.JPG',
      description:
          'Perfectly cut mutton pieces for delicious biryani.',
    ),

    Product(
      name: 'Premium Boneless',
      weight: '500 g',
      price: 449,
      rating: 4.9,
      imageUrl:
          'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?auto=format&fit=crop&w=900&q=85',
      description:
          'Tender boneless mutton for curry and grills.',
    ),

    Product(
      name: 'Curry Cut',
      weight: '500 g',
      price: 379,
      rating: 4.7,
      imageUrl:
          'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=900&q=85',
      description:
          'Bone-in pieces ideal for rich mutton curry.',
    ),

    Product(
      name: 'Mutton Keema',
      weight: '500 g',
      price: 429,
      rating: 4.8,
      imageUrl:
          'https://images.unsplash.com/photo-1529042410759-befb1204b468?auto=format&fit=crop&w=900&q=85',
      description:
          'Fresh minced mutton for keema and kebabs.',
    ),

    Product(
      name: 'Mutton Liver',
      weight: '250 g',
      price: 199,
      rating: 4.6,
      imageUrl:
          'https://images.unsplash.com/photo-1602470520998-f4a52199a3d6?auto=format&fit=crop&w=900&q=85',
      description:
          'Fresh liver perfect for fry and curry.',
    ),

    Product(
      name: 'Mutton Ribs',
      weight: '500 g',
      price: 459,
      rating: 4.8,
      imageUrl:
          'https://wolkifarm.com.au/cdn/shop/files/side-of-mutton-1_grande.jpg?v=1782687729',
      description:
          'Juicy ribs perfect for slow cooking.',
    ),

    Product(
      name: 'Mutton Chops',
      weight: '500 g',
      price: 479,
      rating: 4.9,
      imageUrl:
          'https://wolkifarm.com.au/cdn/shop/files/side-of-mutton-1_grande.jpg?v=1782687729',
      description:
          'Premium chops for grilling and roasting.',
    ),

    Product(
      name: 'Special Cuts',
      weight: '500 g',
      price: 499,
      rating: 5.0,
      imageUrl:
          'https://wolkifarm.com.au/cdn/shop/files/side-of-mutton-1_grande.jpg?v=1782687729',
      description:
          'Chef-selected premium mutton cuts.',
    ),
  ];

  final List<Product> cart = [];
  final List<Product> favourites = [];

  List<Product> get filteredProducts {
    final query =
        searchController.text.trim().toLowerCase();

    if (query.isEmpty) {
      return products;
    }

    return products
        .where(
          (product) =>
              product.name.toLowerCase().contains(query),
        )
        .toList();
  }

  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          '${product.name} added to cart',
        ),
        backgroundColor: primaryGreen,
        duration: const Duration(seconds: 1),
      ),
    );
  }

  void toggleFavourite(Product product) {
    setState(() {
      if (favourites.contains(product)) {
        favourites.remove(product);
      } else {
        favourites.add(product);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,

      // ======================================================
      // APP BAR
      // ======================================================

      appBar: AppBar(
        backgroundColor: bgColor,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: primaryGreen,
                borderRadius:
                    BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.restaurant,
                color: Colors.white,
              ),
            ),
            const SizedBox(width: 10),
            const Text(
              'GoatKart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                selectedIndex = 4;
              });
            },
            icon: const Icon(
              Icons.person_outline,
              color: Colors.white,
            ),
          ),

          Stack(
            children: [
              IconButton(
                onPressed: showCart,
                icon: const Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.white,
                ),
              ),

              if (cart.isNotEmpty)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding:
                        const EdgeInsets.all(4),
                    decoration:
                        const BoxDecoration(
                      color: accentRed,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${cart.length}',
                      style:
                          const TextStyle(
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),

      // ======================================================
      // BODY
      // ======================================================

      body: selectedIndex == 0
          ? buildHome()
          : selectedIndex == 1
              ? buildSearch()
              : selectedIndex == 3
                  ? buildOrders()
                  : selectedIndex == 4
                      ? buildProfile()
                      : buildHome(),

      // ======================================================
      // BOTTOM NAVIGATION
      // ======================================================

      bottomNavigationBar:
          BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          if (index == 2) {
            showCart();
            return;
          }

          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon:
                Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            activeIcon:
                Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.shopping_bag_outlined),
            activeIcon:
                Icon(Icons.shopping_bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.receipt_long_outlined),
            activeIcon:
                Icon(Icons.receipt_long),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.person_outline),
            activeIcon:
                Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // HOME
  // ==========================================================

  Widget buildHome() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(
        16,
        5,
        16,
        25,
      ),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          const Text(
            'Fresh Mutton, Your Way 🥩',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 6),

          const Text(
            'Choose your favourite cut and order fresh.',
            style: TextStyle(
              color: Colors.white54,
              fontSize: 14,
            ),
          ),

          const SizedBox(height: 20),

          // SEARCH
          TextField(
            controller: searchController,
            onChanged: (_) {
              setState(() {});
            },
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              hintText:
                  'Search mutton cuts...',
              prefixIcon:
                  const Icon(Icons.search),
              suffixIcon:
                  searchController.text.isNotEmpty
                      ? IconButton(
                          onPressed: () {
                            searchController.clear();
                            setState(() {});
                          },
                          icon: const Icon(
                            Icons.close,
                            color:
                                Colors.white54,
                          ),
                        )
                      : null,
            ),
          ),

          const SizedBox(height: 25),

          // CATEGORIES
          const Text(
            'Shop by Cut',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 108,
            child: ListView(
              scrollDirection:
                  Axis.horizontal,
              children: [
                category(
                  'Biryani',
                  Icons.rice_bowl,
                  'https://images.unsplash.com/photo-1589302168068-964664d93dc0?auto=format&fit=crop&w=500&q=85',
                ),

                category(
                  'Boneless',
                  Icons.restaurant,
                  'https://images.unsplash.com/photo-1603360946369-dc9bb6258143?auto=format&fit=crop&w=500&q=85',
                ),

                category(
                  'Curry Cut',
                  Icons.set_meal,
                  'https://images.unsplash.com/photo-1544025162-d76694265947?auto=format&fit=crop&w=500&q=85',
                ),

                category(
                  'Keema',
                  Icons.grain,
                  'https://images.unsplash.com/photo-1529042410759-befb1204b468?auto=format&fit=crop&w=500&q=85',
                ),

                category(
                  'Liver',
                  Icons.favorite,
                  'https://images.unsplash.com/photo-1602470520998-f4a52199a3d6?auto=format&fit=crop&w=500&q=85',
                ),

                category(
                  'Ribs',
                  Icons.restaurant_menu,
                  'https://wolkifarm.com.au/cdn/shop/files/side-of-mutton-1_grande.jpg?v=1782687729',
                ),

                category(
                  'Chops',
                  Icons.fastfood,
                  'https://wolkifarm.com.au/cdn/shop/files/side-of-mutton-1_grande.jpg?v=1782687729',
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          promoBanner(),

          const SizedBox(height: 28),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Popular Mutton Cuts',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.bold,
                ),
              ),

              TextButton(
                onPressed: () {},
                child: const Text(
                  'View All',
                  style: TextStyle(
                    color: lightGreen,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          GridView.builder(
            shrinkWrap: true,
            physics:
                const NeverScrollableScrollPhysics(),
            itemCount:
                filteredProducts.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 15,

              // MORE COMPACT CARD
              childAspectRatio: 0.68,
            ),
            itemBuilder:
                (context, index) {
              return productCard(
                filteredProducts[index],
              );
            },
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // CATEGORY
  // ==========================================================

  Widget category(
    String title,
    IconData icon,
    String imageUrl,
  ) {
    return Container(
      width: 82,
      margin:
          const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius:
                BorderRadius.circular(18),
            child: SizedBox(
              width: 66,
              height: 66,
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                filterQuality:
                    FilterQuality.high,
                errorBuilder:
                    (_, __, ___) {
                  return Container(
                    color: cardColor2,
                    child: Icon(
                      icon,
                      color: primaryGreen,
                      size: 30,
                    ),
                  );
                },
              ),
            ),
          ),

          const SizedBox(height: 6),

          Text(
            title,
            maxLines: 1,
            overflow:
                TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
              fontWeight:
                  FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // PROMO BANNER
  // ==========================================================

  Widget promoBanner() {
    return Container(
      height: 175,
      width: double.infinity,
      padding:
          const EdgeInsets.all(22),
      decoration: BoxDecoration(
        gradient:
            const LinearGradient(
          colors: [
            Color(0xFF103D27),
            Color(0xFF176B3A),
            Color(0xFF102C20),
          ],
          begin:
              Alignment.topLeft,
          end:
              Alignment.bottomRight,
        ),
        borderRadius:
            BorderRadius.circular(25),
        border: Border.all(
          color:
              primaryGreen.withOpacity(0.35),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Text(
                  "TODAY'S SPECIAL",
                  style: TextStyle(
                    color: goldColor,
                    fontSize: 11,
                    fontWeight:
                        FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  'Premium Mutton\nDelivered Fresh',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                Container(
                  padding:
                      const EdgeInsets.symmetric(
                    horizontal: 13,
                    vertical: 7,
                  ),
                  decoration:
                      BoxDecoration(
                    color: goldColor,
                    borderRadius:
                        BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: const Text(
                    'ORDER NOW →',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const Icon(
            Icons.restaurant,
            color: goldColor,
            size: 75,
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // PRODUCT CARD
  // ==========================================================

  Widget productCard(Product product) {
    final isFavourite =
        favourites.contains(product);

    return Container(
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius:
            BorderRadius.circular(20),
        border: Border.all(
          color:
              Colors.white.withOpacity(0.06),
        ),
        boxShadow: [
          BoxShadow(
            color:
                Colors.black.withOpacity(0.35),
            blurRadius: 12,
            offset:
                const Offset(0, 5),
          ),
        ],
      ),

      // IMPORTANT:
      // No Expanded around the details.
      // This removes the extra space below the image.
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(20),
        child: Column(
          mainAxisSize:
              MainAxisSize.min,
          crossAxisAlignment:
              CrossAxisAlignment.start,
          children: [
            // ==================================================
            // IMAGE
            // ==================================================

            Stack(
              children: [
                SizedBox(
                  width: double.infinity,

                  // FIXED IMAGE HEIGHT
                  height: 125,

                  child: Image.network(
                    product.imageUrl,

                    // IMPORTANT:
                    // Fills the complete image area.
                    fit: BoxFit.cover,

                    filterQuality:
                        FilterQuality.high,

                    errorBuilder:
                        (_, __, ___) {
                      return Container(
                        color: cardColor2,
                        child:
                            const Center(
                          child: Icon(
                            Icons.restaurant,
                            color:
                                primaryGreen,
                            size: 48,
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // DARK IMAGE OVERLAY
                Positioned.fill(
                  child: IgnorePointer(
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(
                        gradient:
                            LinearGradient(
                          begin:
                              Alignment.topCenter,
                          end:
                              Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black
                                .withOpacity(
                              0.12,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                // FAVOURITE
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () {
                      toggleFavourite(
                        product,
                      );
                    },
                    child: Container(
                      width: 34,
                      height: 34,
                      decoration:
                          const BoxDecoration(
                        color:
                            Colors.black54,
                        shape:
                            BoxShape.circle,
                      ),
                      child: Icon(
                        isFavourite
                            ? Icons.favorite
                            : Icons
                                .favorite_border,
                        color: isFavourite
                            ? Colors.redAccent
                            : Colors.white,
                        size: 19,
                      ),
                    ),
                  ),
                ),

                // PREMIUM
                if (product.price >= 449)
                  Positioned(
                    left: 8,
                    top: 8,
                    child: Container(
                      padding:
                          const EdgeInsets
                              .symmetric(
                        horizontal: 7,
                        vertical: 4,
                      ),
                      decoration:
                          BoxDecoration(
                        color: goldColor,
                        borderRadius:
                            BorderRadius.circular(
                          7,
                        ),
                      ),
                      child:
                          const Text(
                        'PREMIUM',
                        style:
                            TextStyle(
                          color:
                              Colors.black,
                          fontSize: 8,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            // ==================================================
            // DETAILS
            // ==================================================

            Padding(
              padding:
                  const EdgeInsets.fromLTRB(
                10,
                9,
                10,
                10,
              ),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow:
                        TextOverflow.ellipsis,
                    style:
                        const TextStyle(
                      color:
                          Colors.white,
                      fontSize: 15,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color:
                            goldColor,
                        size: 14,
                      ),

                      const SizedBox(
                        width: 3,
                      ),

                      Text(
                        product.rating
                            .toString(),
                        style:
                            const TextStyle(
                          color:
                              Colors.white70,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(
                    height: 4,
                  ),

                  Text(
                    product.description,
                    maxLines: 2,
                    overflow:
                        TextOverflow.ellipsis,
                    style:
                        const TextStyle(
                      color:
                          Colors.white54,
                      fontSize: 10,
                      height: 1.15,
                    ),
                  ),

                  const SizedBox(
                    height: 7,
                  ),

                  Text(
                    product.weight,
                    style:
                        const TextStyle(
                      color:
                          Colors.white54,
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    crossAxisAlignment:
                        CrossAxisAlignment
                            .center,
                    children: [
                      Text(
                        '₹${product.price}',
                        style:
                            const TextStyle(
                          color:
                              creamColor,
                          fontSize: 18,
                          fontWeight:
                              FontWeight.bold,
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          addToCart(
                            product,
                          );
                        },
                        borderRadius:
                            BorderRadius
                                .circular(
                          11,
                        ),
                        child:
                            Container(
                          width: 36,
                          height: 36,
                          decoration:
                              BoxDecoration(
                            color:
                                primaryGreen,
                            borderRadius:
                                BorderRadius
                                    .circular(
                              11,
                            ),
                          ),
                          child:
                              const Icon(
                            Icons.add,
                            color:
                                Colors.white,
                            size: 21,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==========================================================
  // SEARCH SCREEN
  // ==========================================================

  Widget buildSearch() {
    return Padding(
      padding:
          const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'Search Mutton',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 15),

          TextField(
            controller:
                searchController,
            autofocus: true,
            onChanged: (_) {
              setState(() {});
            },
            style:
                const TextStyle(
              color: Colors.white,
            ),
            decoration:
                const InputDecoration(
              hintText:
                  'Search cuts...',
              prefixIcon:
                  Icon(Icons.search),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child:
                filteredProducts.isEmpty
                    ? const Center(
                        child: Text(
                          'No mutton cut found.',
                          style:
                              TextStyle(
                            color:
                                Colors.white54,
                          ),
                        ),
                      )
                    : GridView.builder(
                        itemCount:
                            filteredProducts
                                .length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              2,
                          crossAxisSpacing:
                              12,
                          mainAxisSpacing:
                              15,
                          childAspectRatio:
                              0.68,
                        ),
                        itemBuilder:
                            (context,
                                index) {
                          return productCard(
                            filteredProducts[
                                index],
                          );
                        },
                      ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // ORDERS
  // ==========================================================

  Widget buildOrders() {
    return SingleChildScrollView(
      padding:
          const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          const Text(
            'My Orders',
            style: TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 20),

          Container(
            width: double.infinity,
            padding:
                const EdgeInsets.all(22),
            decoration:
                BoxDecoration(
              color: cardColor,
              borderRadius:
                  BorderRadius.circular(
                22,
              ),
              border: Border.all(
                color: Colors.white10,
              ),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.receipt_long,
                  color:
                      primaryGreen,
                  size: 65,
                ),

                const SizedBox(
                    height: 12),

                const Text(
                  'No Orders Yet',
                  style:
                      TextStyle(
                    color:
                        Colors.white,
                    fontSize: 20,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(
                    height: 7),

                const Text(
                  'Your previous orders will appear here.',
                  textAlign:
                      TextAlign.center,
                  style:
                      TextStyle(
                    color:
                        Colors.white54,
                  ),
                ),

                const SizedBox(
                    height: 20),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selectedIndex =
                          0;
                    });
                  },
                  style:
                      ElevatedButton
                          .styleFrom(
                    backgroundColor:
                        primaryGreen,
                  ),
                  child:
                      const Text(
                    'Start Shopping',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // PROFILE
  // ==========================================================

  Widget buildProfile() {
    return SingleChildScrollView(
      padding:
          const EdgeInsets.all(20),
      child: Column(
        children: [
          const SizedBox(
              height: 15),

          Container(
            width: 95,
            height: 95,
            decoration:
                BoxDecoration(
              color:
                  primaryGreen,
              shape:
                  BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color:
                      primaryGreen
                          .withOpacity(
                    0.25,
                  ),
                  blurRadius: 20,
                ),
              ],
            ),
            child: const Icon(
              Icons.person,
              color:
                  Colors.white,
              size: 52,
            ),
          ),

          const SizedBox(
              height: 15),

          const Text(
            'GoatKart User',
            style:
                TextStyle(
              color:
                  Colors.white,
              fontSize: 23,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(
              height: 5),

          const Text(
            'Welcome to GoatKart',
            style:
                TextStyle(
              color:
                  Colors.white54,
            ),
          ),

          const SizedBox(
              height: 30),

          profileOption(
            Icons.person_outline,
            'My Account',
          ),

          profileOption(
            Icons.location_on_outlined,
            'Delivery Address',
          ),

          profileOption(
            Icons.favorite_border,
            'Favourite Cuts',
          ),

          profileOption(
            Icons.payment,
            'Payment Methods',
          ),

          profileOption(
            Icons.notifications_none,
            'Notifications',
          ),

          profileOption(
            Icons.help_outline,
            'Help & Support',
          ),

          profileOption(
            Icons.info_outline,
            'About GoatKart',
          ),
        ],
      ),
    );
  }

  Widget profileOption(
    IconData icon,
    String title,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 10,
      ),
      decoration:
          BoxDecoration(
        color: cardColor,
        borderRadius:
            BorderRadius.circular(
          16,
        ),
      ),
      child: ListTile(
        leading: Container(
          width: 42,
          height: 42,
          decoration:
              BoxDecoration(
            color:
                primaryGreen
                    .withOpacity(
              0.12,
            ),
            borderRadius:
                BorderRadius.circular(
              12,
            ),
          ),
          child: Icon(
            icon,
            color: lightGreen,
          ),
        ),
        title: Text(
          title,
          style:
              const TextStyle(
            color:
                Colors.white,
            fontWeight:
                FontWeight.w600,
          ),
        ),
        trailing:
            const Icon(
          Icons.chevron_right,
          color:
              Colors.white38,
        ),
        onTap: () {},
      ),
    );
  }

  // ==========================================================
  // CART
  // ==========================================================

  void showCart() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor:
          cardColor,
      shape:
          const RoundedRectangleBorder(
        borderRadius:
            BorderRadius.vertical(
          top: Radius.circular(28),
        ),
      ),
      builder: (context) {
        return StatefulBuilder(
          builder:
              (context, setModalState) {
            int total = 0;

            for (final product
                in cart) {
              total +=
                  product.price;
            }

            return SizedBox(
              height:
                  MediaQuery.of(
                        context,
                      ).size.height *
                      0.78,
              child: Padding(
                padding:
                    const EdgeInsets.all(
                  20,
                ),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                  children: [
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text(
                          'Your Cart 🛒',
                          style:
                              TextStyle(
                            color:
                                Colors.white,
                            fontSize: 25,
                            fontWeight:
                                FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );
                          },
                          icon:
                              const Icon(
                            Icons.close,
                            color:
                                Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                        height: 10),

                    if (cart.isEmpty)
                      const Expanded(
                        child:
                            Center(
                          child: Column(
                            mainAxisAlignment:
                                MainAxisAlignment
                                    .center,
                            children: [
                              Icon(
                                Icons
                                    .shopping_bag_outlined,
                                color:
                                    Colors.white24,
                                size: 75,
                              ),
                              SizedBox(
                                  height:
                                      12),
                              Text(
                                'Your cart is empty',
                                style:
                                    TextStyle(
                                  color:
                                      Colors.white,
                                  fontSize:
                                      19,
                                  fontWeight:
                                      FontWeight
                                          .bold,
                                ),
                              ),
                              SizedBox(
                                  height:
                                      5),
                              Text(
                                'Add fresh mutton cuts to continue.',
                                style:
                                    TextStyle(
                                  color:
                                      Colors.white54,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    else
                      Expanded(
                        child:
                            ListView.builder(
                          itemCount:
                              cart.length,
                          itemBuilder:
                              (context,
                                  index) {
                            final product =
                                cart[index];

                            return Container(
                              margin:
                                  const EdgeInsets.only(
                                bottom:
                                    10,
                              ),
                              decoration:
                                  BoxDecoration(
                                color:
                                    cardColor2,
                                borderRadius:
                                    BorderRadius
                                        .circular(
                                  15,
                                ),
                              ),
                              child:
                                  ListTile(
                                contentPadding:
                                    const EdgeInsets
                                        .symmetric(
                                  horizontal:
                                      10,
                                ),
                                leading:
                                    ClipRRect(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                    10,
                                  ),
                                  child:
                                      SizedBox(
                                    width:
                                        58,
                                    height:
                                        58,
                                    child:
                                        Image.network(
                                      product
                                          .imageUrl,
                                      fit:
                                          BoxFit.cover,
                                      errorBuilder:
                                          (_,
                                              __,
                                              ___) {
                                        return Container(
                                          color:
                                              cardColor,
                                          child:
                                              const Icon(
                                            Icons
                                                .restaurant,
                                            color:
                                                primaryGreen,
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                                title:
                                    Text(
                                  product
                                      .name,
                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.white,
                                    fontWeight:
                                        FontWeight.bold,
                                  ),
                                ),
                                subtitle:
                                    Text(
                                  product
                                      .weight,
                                  style:
                                      const TextStyle(
                                    color:
                                        Colors.white54,
                                  ),
                                ),
                                trailing:
                                    Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment
                                          .center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment
                                          .end,
                                  children: [
                                    Text(
                                      '₹${product.price}',
                                      style:
                                          const TextStyle(
                                        color:
                                            lightGreen,
                                        fontWeight:
                                            FontWeight.bold,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:
                                          () {
                                        setState(
                                          () {
                                            cart.removeAt(
                                              index,
                                            );
                                          });

                                        setModalState(
                                          () {},
                                        );
                                      },
                                      child:
                                          const Text(
                                        'Remove',
                                        style:
                                            TextStyle(
                                          color:
                                              Colors.redAccent,
                                          fontSize:
                                              11,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                    if (cart.isNotEmpty) ...[
                      Container(
                        padding:
                            const EdgeInsets
                                .all(15),
                        decoration:
                            BoxDecoration(
                          color:
                              cardColor2,
                          borderRadius:
                              BorderRadius
                                  .circular(
                            16,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment:
                              MainAxisAlignment
                                  .spaceBetween,
                          children: [
                            const Text(
                              'Total',
                              style:
                                  TextStyle(
                                color:
                                    Colors.white70,
                                fontSize:
                                    16,
                              ),
                            ),
                            Text(
                              '₹$total',
                              style:
                                  const TextStyle(
                                color:
                                    creamColor,
                                fontSize:
                                    22,
                                fontWeight:
                                    FontWeight
                                        .bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                          height: 12),

                      SizedBox(
                        width:
                            double.infinity,
                        height: 54,
                        child:
                            ElevatedButton(
                          onPressed: () {
                            Navigator.pop(
                              context,
                            );

                            ScaffoldMessenger
                                .of(
                              context,
                            ).showSnackBar(
                              const SnackBar(
                                content:
                                    Text(
                                  'Checkout screen coming next!',
                                ),
                                backgroundColor:
                                    primaryGreen,
                              ),
                            );
                          },
                          style:
                              ElevatedButton
                                  .styleFrom(
                            backgroundColor:
                                primaryGreen,
                            foregroundColor:
                                Colors.white,
                            shape:
                                RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius
                                      .circular(
                                15,
                              ),
                            ),
                          ),
                          child:
                              const Text(
                            'Proceed to Checkout',
                            style:
                                TextStyle(
                              fontSize:
                                  16,
                              fontWeight:
                                  FontWeight
                                      .bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

// ============================================================
// PRODUCT MODEL
// ============================================================

class Product {
  final String name;
  final String weight;
  final int price;
  final double rating;
  final String imageUrl;
  final String description;

  Product({
    required this.name,
    required this.weight,
    required this.price,
    required this.rating,
    required this.imageUrl,
    required this.description,
  });
}