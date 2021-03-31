<?php
/**
 * The base configuration for WordPress
 *
 * The wp-config.php creation script uses this file during the
 * installation. You don't have to use the web site, you can
 * copy this file to "wp-config.php" and fill in the values.
 *
 * This file contains the following configurations:
 *
 * * MySQL settings
 * * Secret keys
 * * Database table prefix
 * * ABSPATH
 *
 * @link https://wordpress.org/support/article/editing-wp-config-php/
 *
 * @package WordPress
 */

// ** MySQL settings - You can get this info from your web host ** //
/** The name of the database for WordPress */
define( 'DB_NAME', 'chez_sgrondin' );

/** MySQL database username */
define( 'DB_USER', 'wpuser' );

/** MySQL database password */
define( 'DB_PASSWORD', 'verysecurepassword' );

/** MySQL hostname */
define( 'DB_HOST', 'localhost' );

/** Database Charset to use in creating database tables. */
define( 'DB_CHARSET', 'utf8' );

/** The Database Collate type. Don't change this if in doubt. */
define( 'DB_COLLATE', '' );

/**#@+
 * Authentication Unique Keys and Salts.
 *
 * Change these to different unique phrases!
 * You can generate these using the {@link https://api.wordpress.org/secret-key/1.1/salt/ WordPress.org secret-key service}
 * You can change these at any point in time to invalidate all existing cookies. This will force all users to have to log in again.
 *
 * @since 2.6.0
 */
define('AUTH_KEY',         '?d:6u888+:sO9v,<zEF*`0)z%NDe:!)n5u9VqbWCa`WWeO:sV%f4`5G3#gK]*coi');
define('SECURE_AUTH_KEY',  '>;d`Zogy;-At&NgMnMkH:S0%83tz:77mkRPLNa5FN#`,!Jc}Y -&!jV98pG?jEC(');
define('LOGGED_IN_KEY',    '=YK<O+.(=r6)b&uz%6HmB-8M9 1Ke~Gf,QPQ|c~FExty?nZ4YRVF9+2<2/cGC2ey');
define('NONCE_KEY',        'TRL*(/|4;Y,}CYP46USxlo)fUQ5iJ%WO?Rc,3FZ.XvBdFVI2]flL4V;dJW66(IZ+');
define('AUTH_SALT',        ',$jY8SO-@?b<:w~4EH4.mRUih+5Qktr%RlG){7%nKQ`|,oCY@!l?UE+knzwaH}hP');
define('SECURE_AUTH_SALT', 'IKcdStGLv|up-X_Pt-dn++<1FC@@[>}NRz69*-q!xX~j|2TPEj2;S)gM3kp0I`t4');
define('LOGGED_IN_SALT',   'x,,JBR8rcEI+&5{Ae{g47d2`k#k=)=txKe]ZobL?c ]!@ea_DGOMEgv*T!CzL}@ ');
define('NONCE_SALT',       '>}-|e|K$qCKdec+VBvKqZ2~/YrCR;=.X!Or+Viq}{Ia<O,yE!/W,V+0p,;^8EOfD');

/**#@-*/

/**
 * WordPress Database Table prefix.
 *
 * You can have multiple installations in one database if you give each
 * a unique prefix. Only numbers, letters, and underscores please!
 */
$table_prefix = 'wp_';

/**
 * For developers: WordPress debugging mode.
 *
 * Change this to true to enable the display of notices during development.
 * It is strongly recommended that plugin and theme developers use WP_DEBUG
 * in their development environments.
 *
 * For information on other constants that can be used for debugging,
 * visit the documentation.
 *
 * @link https://wordpress.org/support/article/debugging-in-wordpress/
 */
define( 'WP_DEBUG', false );

/* That's all, stop editing! Happy publishing. */

/** Absolute path to the WordPress directory. */
if ( ! defined( 'ABSPATH' ) ) {
	define( 'ABSPATH', __DIR__ . '/' );
}

/** Sets up WordPress vars and included files. */
require_once ABSPATH . 'wp-settings.php';