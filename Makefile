include makefile_header
# include additional makefile headers here

# add needed cflags here
DSI_CFLAGS=$(GLOBUS_CFLAGS)  -ggdb

# add needed includes here
DSI_INCLUDES=$(GLOBUS_INCLUDES) -IMAGIC_VDT_LOCATION/hadoop/src/c++/libhdfs -IMAGIC_VDT_LOCATION/jdk1.5/include -IMAGIC_VDT_LOCATION/jdk1.5/include/linux

# added needed ldflags here
DSI_LDFLAGS=$(GLOBUS_LDFLAGS) -fPIC -LMAGIC_VDT_LOCATION/hadoop/build/libhdfs

# add needed libraries here
DSI_LIBS=-lhdfs

FLAVOR=gcc64dbg

globus_gridftp_server_hdfs.o:
	$(GLOBUS_CC) $(DSI_CFLAGS) $(DSI_INCLUDES) \
		-shared -o libglobus_gridftp_server_hdfs_$(FLAVOR).so \
		globus_gridftp_server_hdfs.c \
		$(DSI_LDFLAGS) $(DSI_LIBS)

install:
	cp -f libglobus_gridftp_server_hdfs_$(FLAVOR).so $(GLOBUS_LOCATION)/lib

clean:
	rm -f *.so