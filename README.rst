Find out which root CAs the TLS servers use::

   $ cat urls
   https://www.debian.org/
   ldaps://db.debian.org/
   https://lwn.net/
   https://en.wikipedia.org/

   $ xargs skeptica < urls
   https://www.debian.org/	/usr/share/ca-certificates/mozilla/UTN_USERFirst_Hardware_Root_CA.crt
   ldaps://db.debian.org/	/usr/share/ca-certificates/mozilla/UTN_USERFirst_Hardware_Root_CA.crt
   https://lwn.net/	/usr/share/ca-certificates/mozilla/GeoTrust_Global_CA.crt
   https://en.wikipedia.org/	/usr/share/ca-certificates/mozilla/DigiCert_High_Assurance_EV_Root_CA.crt

.. vim:ft=rst ts=3 sw=3 et
