# Define this to 1 if you want to include eagle_lwip_if.o in liblwip.a
USE_OUR_LWIP_IF = 0

# Set this to your libmain.a path if you want to replace eagle_lwip_if.o
# inside of it with our own version
LIBMAIN_PATH =

# Set this if you don't want fake espconn_init() to be defined. Don't do
# this if you're using SDK >=1.0
# ESPCONN_FAKE_INIT = 0
