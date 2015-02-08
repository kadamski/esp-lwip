CC = xtensa-lx106-elf-gcc
AR = xtensa-lx106-elf-ar
OBJCOPY = xtensa-lx106-elf-objcopy

CFLAGS = -Os -mlongcalls -Isrc/include/ -Isrc/include/ipv4/ -Iconfig/ -Iespressif/include/

CFLAGS += -DLWIP_OPEN_SRC
CFLAGS += -D__ets__

OBJS = \
src/api/api_lib.o \
src/api/api_msg.o \
src/api/err.o \
src/api/netbuf.o \
src/api/netdb.o \
src/api/netifapi.o \
src/api/sockets.o \
src/api/tcpip.o \
src/core/ipv4/autoip.o \
src/core/ipv4/icmp.o \
src/core/ipv4/igmp.o \
src/core/ipv4/inet.o \
src/core/ipv4/inet_chksum.o \
src/core/ipv4/ip.o \
src/core/ipv4/ip_addr.o \
src/core/ipv4/ip_frag.o \
src/core/dhcp.o \
src/core/dns.o \
src/core/def.o \
src/core/init.o \
src/core/netif.o \
src/core/mem.o \
src/core/memp.o \
src/core/pbuf.o \
src/core/raw.o \
src/core/stats.o \
src/core/sys.o \
src/core/tcp.o \
src/core/tcp_in.o \
src/core/tcp_out.o \
src/core/timers.o \
src/core/udp.o \
src/netif/etharp.o \
espressif/espconn.o \
espressif/espconn_tcp.o \
espressif/espconn_udp.o \
espressif/sys_arch.o \
espressif/netio.o \
espressif/dhcpserver.o \
espressif/ping.o \

.PHONY: all

%.o: %.c
	$(CC) -c $(CFLAGS) -o $@ $<
	$(OBJCOPY) --rename-section .text=.irom0.text --rename-section .literal=.irom0.literal $@

all: liblwip.a our/eagle_lwip_if.o

liblwip.a: $(OBJS)
	$(AR) rcs liblwip.a $(OBJS)

clean:
	rm $(OBJS) liblwip.a our/eagle_lwip_if.o
