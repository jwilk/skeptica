Find out which root CAs the TLS servers use::

   $ cat urls
   https://bitbucket.org/jwilk/skeptica
   https://www.debian.org/
   ldaps://db.debian.org/
   https://lwn.net/

   $ xargs skeptica < urls
   https://bitbucket.org/jwilk/skeptica	/usr/share/ca-certificates/mozilla/DigiCert_High_Assurance_EV_Root_CA.crt
   https://www.debian.org/	/usr/share/ca-certificates/mozilla/UTN_USERFirst_Hardware_Root_CA.crt
   ldaps://db.debian.org/	/usr/share/ca-certificates/mozilla/UTN_USERFirst_Hardware_Root_CA.crt
   https://lwn.net/	/usr/share/ca-certificates/mozilla/GeoTrust_Global_CA.crt

.. vim:ft=rst ts=3 sts=3 sw=3 et
