# IMAP settings (Dovecot)
 $config['default_host'] = 'ssl://mail.elbethelacademy.com'; # Your IMAP server hostname.
 $config['default_port'] = 993;                              # Default is 143, use 993 for SSL connections.
 $config['imap_auth_type'] = null;                           # You can specify an AUTH type (PLAIN, LOGIN, CRAM-MD5, etc.)

# SMTP settings (Postfix)
 $config['smtp_server'] = 'tls://mail.elbethelacademy.com';   # Your SMTP server hostname. Use tls:// or ssl:// as required.
 $config['smtp_port'] = 587;                                 # Commonly 25, 465 (SSL) or 587 (STARTTLS).
 $config['smtp_user'] = '%u';                                # Special variable that uses the current username for SMTP auth.
 $config['smtp_pass'] = '%p';                                # Special variable that uses the current user’s password.


cat /var/www/html/roundcube/config/config.inc.php

SET PASSWORD FOR 'roundcube'@'localhost' = PASSWORD('1ncrease');
FLUSH PRIVILEGES;
$config['db_dsnw'] = 'mysql://roundcube:1ncrease@localhost/roundcubemail';
