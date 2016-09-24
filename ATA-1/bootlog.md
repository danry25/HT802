bootrom v2.0
 * trying primary boot device ...
     * checking preloader at 0x00000000... ok
Bootastic v1.2.6.1-rc2-00004-gb1bfccc-dirty
Found a valid GS uboot image
Using uboot partition image


U-Boot dvf99 v1.2.6.1-rc2 2012.04.01 (Feb 09 2015 - 13:19:47) evb9918-ht

CPU:   DVF99 (rev 16/2: BBC): 400 MHz (CSS@400, PCLK@133)
BOARD: evb9918-ht
MEM:   SDRAM
DRAM:  32 MiB
WARNING: Caches not enabled
Flash: 16 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   RMII, gmac0@100Mbps
Hit Esc key to stop autoboot:  1  0 
Checking core partition...
Checking base partition...
Checking prog partition...
Checking core2 partition...
Checking base2 partition...
Checking prog2 partition...
Core version=1.0.0.18 Base version=1.0.0.23 Prog version=1.0.0.24 Compatible with core 1.0.0.18 and base 1.0.0.23, Provision Counter=0
Core2 version=1.0.0.18 Base2 version=1.0.0.23 Prog2 version=1.0.0.24 Compatible with core 1.0.0.18 and base 1.0.0.23, Provision Counter=0
All partitions look ok
core base prog are compatible
core2 base2 prog2 are compatible
Compare progs, both are equal
Compare bases, both are equal
Compare cores, both are equal
Selecting core, base and prog.
## Booting kernel from Legacy Image at c8800000 ...
   Image Name:   Linux-3.4.20-rt31-dvf-v1.2.6.1-r
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    984296 Bytes = 961.2 KiB
   Load Address: c8008000
   Entry Point:  c8008000
   Verifying Checksum ... OK
## Flattened Device Tree blob at c8c00000
   Booting using the fdt blob at 0xc8c00000
   Loading Kernel Image ... OK
OK
   Loading Device Tree to c9d2c000, end c9d337fd ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
[    0.000000] Booting Linux on physical CPU 0
[    0.000000] Linux version 3.4.20-rt31-dvf-v1.2.6.1-rc2 (zlcao@zlcao-VBox) (gcc version 4.6.4 20120303 (prerelease) (GCC) ) #96 PREEMPT Wed Apr 29 16:04:18 CDT 2015
[    0.000000] CPU: ARM926EJ-S [41069265] revision 5 (ARMv5TEJ), cr=00053177
[    0.000000] CPU: VIVT data cache, VIVT instruction cache
[    0.000000] Machine: DSPG DVF99, model: DVF9918 on EVB
[    0.000000] calling do_early_param gxp_console 0
[    0.000000] calling do_early_param root /dev/mtdblock6
[    0.000000] calling do_early_param bootpartition 0
[    0.000000] calling do_early_param mtdparts qspi:16k(bootastic),48k(factory),64k(nvram),256k(uboot),1280k(core),1280k(core2),3072k(base),3072k(base2),3324k(prog),3324k(prog2),128k(lang),128k(lang2),128k(oem),8k(uboot_env),-(uboot2)
[    0.000000] Memory policy: ECC disabled, Data cache writeback
[    0.000000] Built 1 zonelists in Zone order, mobility grouping off.  Total pages: 7360
[    0.000000] Kernel command line: gxp_console=0 root=/dev/mtdblock6 bootpartition=0 mtdparts=qspi:16k(bootastic),48k(factory),64k(nvram),256k(uboot),1280k(core),1280k(core2),3072k(base),3072k(base2),3324k(prog),3324k(prog2),128k(lang),128k(lang2),128k(oem),8k(uboot_env),-(uboot2)
[    0.000000] PID hash table entries: 128 (order: -3, 512 bytes)
[    0.000000] Dentry cache hash table entries: 4096 (order: 2, 16384 bytes)
[    0.000000] Inode-cache hash table entries: 2048 (order: 1, 8192 bytes)
[    0.000000] Memory: 26MB 3MB = 29MB total
[    0.000000] Memory: 26536k/26536k available, 6232k reserved, 0K highmem
[    0.000000] Virtual kernel memory layout:
[    0.000000]     vector  : 0xffff0000 - 0xffff1000   (   4 kB)
[    0.000000]     fixmap  : 0xfff00000 - 0xfffe0000   ( 896 kB)
[    0.000000]     vmalloc : 0xd2800000 - 0xff000000   ( 712 MB)
[    0.000000]     lowmem  : 0xd0000000 - 0xd2000000   (  32 MB)
[    0.000000]     modules : 0xcf000000 - 0xd0000000   (  16 MB)
[    0.000000]       .text : 0xd0008000 - 0xd0251e14   (2344 kB)
[    0.000000]       .init : 0xd0252000 - 0xd026b000   ( 100 kB)
[    0.000000]       .data : 0xd026c000 - 0xd0284480   (  98 kB)
[    0.000000]        .bss : 0xd02844a4 - 0xd02b9dd8   ( 215 kB)
[    0.000000] NR_IRQS:16 nr_irqs:16 16
[    0.000000] sched_clock: 32 bits at 1000kHz, resolution 1000ns, wraps every 4294967ms
[    0.000229] Calibrating delay loop... 199.06 BogoMIPS (lpj=995328)
[    0.069968] pid_max: default: 32768 minimum: 301
[    0.070513] Mount-cache hash table entries: 512
[    0.071947] CPU: Testing write buffer coherency: ok
[    0.072881] Setting up static identity map for 0xc81c1fb0 - 0xc81c2008
[    0.075711] dummy: 
[    0.076151] NET: Registered protocol family 16
[    0.089863] bio: create slab <bio-0> at 0
[    0.091871] gpiochip_add: registered GPIOs 0 to 159 on device: gpio-dspg
[    0.091924] gpio-dspg 5000000.gpio-controller: 5 banks
[    0.092624] 3v3: 3300 mV 
[    0.094199] spi-dspg-dcx 5e00000.spi: master is unqueued, this is deprecated
[    0.097358] Switching to clocksource dspg-rtc
[    0.099691] NET: Registered protocol family 2
[    0.100694] IP route cache hash table entries: 1024 (order: 0, 4096 bytes)
[    0.101979] TCP established hash table entries: 1024 (order: 1, 8192 bytes)
[    0.102076] TCP bind hash table entries: 1024 (order: 0, 4096 bytes)
[    0.102141] TCP: Hash tables configured (established 1024 bind 1024)
[    0.102169] TCP: reno registered
[    0.102201] UDP hash table entries: 256 (order: 0, 4096 bytes)
[    0.102260] UDP-Lite hash table entries: 256 (order: 0, 4096 bytes)
[    0.102801] NET: Registered protocol family 1
[    0.103463] reset_button: valid
[    0.106642] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.106739] msgmni has been set to 51
[    0.108974] io scheduler noop registered
[    0.109016] io scheduler deadline registered (default)
[    0.109307] LED_PHONE1: valid
[    0.109350] LED_PHONE2: valid
[    0.109373] LED_WAN: valid
[    0.109395] LED_RJ45: valid
[    0.110493] spi_dev[0] = 0xd1022ac0
[    0.110531] ptr_si3217x[0] = 0xd1fd1800
[    0.110595] dvf_si32178_spi si3217x-daa.0: successfully registered
[    0.111378] 5a00000.serial: ttyS0 at MMIO 0x5a00000 (irq = 38) is a DSPG_UART
[    0.491491] console [ttyS0] enabled
[    0.495581] 5b00000.serial: ttyS1 at MMIO 0x5b00000 (irq = 39) is a DSPG_UART
[    0.515000] brd: module loaded
[    0.518343] <<<-- dvf9a_probe
[    0.524055] dvf9a 6300000.dvf9a: successfully registered (DVF9A version 2)
[    0.531242] --> dvf9a_probe
[    0.535440] Setting QSPI Frequency: 33 MHz
[    0.540129] CS0: jedecid: 0xc84018 extid: 0xc840
[    0.545691] 15 cmdlinepart partitions found on MTD device qspi
[    0.551697] Creating 15 MTD partitions on "qspi":
[    0.556448] 0x000000000000-0x000000004000 : "bootastic"
[    0.563908] 0x000000004000-0x000000010000 : "factory"
[    0.571139] 0x000000010000-0x000000020000 : "nvram"
[    0.578131] 0x000000020000-0x000000060000 : "uboot"
[    0.585021] 0x000000060000-0x0000001a0000 : "core"
[    0.592117] 0x0000001a0000-0x0000002e0000 : "core2"
[    0.599253] 0x0000002e0000-0x0000005e0000 : "base"
[    0.605855] 0x0000005e0000-0x0000008e0000 : "base2"
[    0.612796] 0x0000008e0000-0x000000c1f000 : "prog"
[    0.619697] 0x000000c1f000-0x000000f5e000 : "prog2"
[    0.626440] 0x000000f5e000-0x000000f7e000 : "lang"
[    0.633283] 0x000000f7e000-0x000000f9e000 : "lang2"
[    0.640315] 0x000000f9e000-0x000000fbe000 : "oem"
[    0.647037] 0x000000fbe000-0x000000fc0000 : "uboot_env"
[    0.654345] 0x000000fc0000-0x000001000000 : "uboot2"
[    0.661513] Setting QSPI Frequency: 50 MHz
[    0.665649] dspg-qspic 5500000.qspic: cs0:qspi
[    0.670361] CS1: jedecid: 0x000000 extid: 0x0000
[    0.675024] CS1: jedecid: 0x222aaa extid: 0xaaaa
[    0.681709] Fixed MDIO Bus: probed
[    0.685778] stmmac - user ID: 0x20, Synopsys ID: 0x37
[    0.691128]  DMA HW capability register supported
[    0.695673]  Normal descriptors
[    0.699111]  RX Checksum Offload Engine supported
[    0.703826]  TX Checksum insertion supported
[    0.708196]  Wake-Up On Lan supported
[    0.727579] stmmac: probed
[    0.731553] eth0: PHY ID 00221561 at 0 IRQ POLL (stmmac-0:00) active
[    0.738449] NET: Registered protocol family 40
[    0.743165] coma-dvf9a dvf9a-coma.14: successfully registered
[    0.749630] coma-sharedmem sharedmem.2: successfully registered
[    0.758384] dspg-crypto 6c00000.secure: DSPG cryptographic security module (revision 5/0)
[    0.769020] valid part ( 0 0 )
[    0.772670] valid part ( 1 0 )
[    0.776285] valid part ( 2 0 )
[    0.780134] valid part ( 3 0 )
[    0.783760] valid part ( 4 0 )
[    0.787371] valid part ( 5 0 )
[    0.791055] valid part ( 6 0 )
[    0.794674] valid part ( 7 0 )
[    0.797748] Set max_id = 99
[    0.800528] Set max_id = 100
[    0.803444] Set max_id = 101
[    0.806361] Set max_id = 102
[    0.809322] NVRAM found at ( 3, 0 ).  ID = 102
[    0.815501] Inflate: 1, total_out=7797
[    0.819537] nvram: 4147 -> 7797 (50% -> 11%)
[    0.826189] NVRAM Driver Initialized
[    0.830871] TCP: bic registered
[    0.834019] NET: Registered protocol family 17
[    0.839230] dvf-pm pm.0: idle driver not registered: -19
[    0.852626] VFS: Mounted root (squashfs filesystem) readonly on device 31:6.
[    0.860723] Freeing init memory: 100K

init started: BusyBox v1.15.3 (2015-02-06 14:23:20 CST)

starting pid 43, tty '': '/etc/rc.d/rc.sysinit'
Mounting filesystems...
*** Flash Boot ***
Mounting Root FS...
Loading nvdefault from /oem_profile/23/oem_default_values
Loading nvdefault from /etc/default_values
done
Info: Mounting tmpfs to /ram
mount /dev/mtdblock8 /app
Info: App partition mounted
[    3.107419] Invalid Signature for Parititon lang
[    3.117574] LED_HT: Turning all(4) LEDs ON/OFF
Info: create tmpfs partition... 
Info: Copying /etc to /ram...
Info: Making symlinks... 
Info: Replacing /
[    5.888568] css 8200000.css: loading DVF99 CSS image
[    5.893616] css 8200000.css: MD5 sum of ELF file: 0xCEB2C0C1E43FE9A1B91CB07D141C5986
[    5.976094] css 8200000.css: successfully loaded CSS firmware
[    6.106027] voice: character device initialized (major=253)
Reset button poll routine started. Compiled on Dec 15 2014, 15:39:48 running every 200ms
Starting HT8XX LED Pattern driver ...
Pvalue validation server started. Socket name is /tmp/.pvalue_validation
[    6.712828] LED Pattern control for HT802 (Ver 1.0, Compiled on Dec 15 2014, 15:46:46, running every 250ms)
/
Prepare conf
Loading custom certificate and private key
Initializing random number generator... done.
Setting Hostname: HT8XX
[   11.340623] eth0: device MAC address 00:0b:82:85:c5:67
[   11.359921]  No MAC Management Counters available
Starting DHCP Client ....
deconfig dhcpc
leasefail dhcpc
client [0x8001] group(1) registered on 0
Event notify received, pvalue :ini_prov changed
Starting HT8XX SLIC BSP driver...
[   25.513677] SiLabs BSP driver, version 1.0.0, Compiled on Oct 21 2014, 17:52:05 for Linux kernel 3.4.20-rt31-dvf-v1.2.6.1-rc2
[   25.513721] 
calling get_si3217x_priv reutrn spi_dev[0] = 0xd1fd1800
[   25.540738] ptr_si3217x_priv: d1fd1800, spi_dev: d1022ac0
[   25.548435] fxs-reset-0 149
[   25.551648] local_int_data[0].int_gpio/irq = 16/46
[   25.556591] local_int_data[1].int_gpio/irq = -22/0
[   25.561526] local_int_data[2].int_gpio/irq = -22/0
[   25.566389] local_int_data[3].int_gpio/irq = -22/0
Starting TAPI device driver...
[   25.646749] IFX TAPI for HT7XX, version 4.0.18.0, Compiled on Jun 22 2015, 14:30:57 for Linux kernel 3.4.20-rt31-dvf-v1.2.6.1-rc2
[   25.646794] 

[   25.668373] BUFF: Initial pool size set to 4000 bytes 
[   25.673889] BUFF: Incremental step size set to 4000 bytes
[   25.679515] BUFF: Max expansion size set to 3145728 bytes
[   25.685007] BUFF: initBuffer with size=4000, ts=42675342
[   25.690446] BUFF: Remaining size for expansion is 3141728 bytes
[   25.696486] 
[   25.696494] BUFF: Initial pool size set to 4600 bytes 
[   25.703233] BUFF: Incremental step size set to 4600 bytes
[   25.708758] BUFF: Max expansion size set to 3145728 bytes
[   25.714230] BUFF: initBuffer with size=4600, ts=42675372
[   25.719652] BUFF: Remaining size for expansion is 3137128 bytes
Starting silabs device driver...
[   25.854719] IFX SiLabs device driver, version 7.2.7.0, Compiled on Jun 22 2015, 14:31:08 for Linux kernel 3.4.20-rt31-dvf-v1.2.6.1-rc2
[   25.854757] 

Set HTML language to default (English)
Event notify received, pvalue :342a changed
Event notify received, pvalue :Registered changed
Event notify received, pvalue :Not Registered changed
Event notify received, pvalue :Off Hook changed
Event notify received, pvalue :On Hook changed
Event notify received, pvalue :Busy changed
Event notify received, pvalue :In Use changed
Event notify received, pvalue :Idle changed
Event notify received, pvalue :Ring changed
Event notify received, pvalue :Ring Back changed
Event notify received, pvalue :Yes changed
Event notify received, pvalue :No changed
Event notify received, pvalue :Disabled changed
Event notify received, pvalue :Enabled changed
Event notify received, pvalue :Open Internet changed
Event notify received, pvalue :Full Cone NAT changed
Event notify received, pvalue :Restricted Cone NAT changed
Event notify received, pvalue :Port Restricted Cone NAT changed
Event notify received, pvalue :Symmetric NAT changed
Event notify received, pvalue :Symmetric UDP changed
Event notify received, pvalue :UDP Blocked changed
Event notify received, pvalue :Unknown NAT changed
Event notify received, pvalue :Unknown changed
Starting HTTP Server ....
Starting gs_ata...

Please press Enter to activate this console. Event notify received, pvalue nvram_commit changed
HT802  Program starting, compiled on Jul 30 2015 22:42:49
[   30.892711] 
Found 1 SLIC devices with 2 channel and 0 DAA devices wtih 0 channel(s) and support for 3 REN per port [   30.894460] BSP HT8XX: 
HW assert Nuvoton chip Reset pin
[   30.927716] BSP HT8XX: HW de-assert Nuvoton chip Reset pin
APP: fd_ch[0/2]=/dev/fxs00
[   30.940504] NUV_GET_HOST_ACCESS for Nuvoton dev 0 irq=46 *spi=0xd1022ac0
[   30.957687] ht_int_connect irq = 46
[   30.961189] BSP HT8XX: IRQ request 46
[   30.964889] 
[   30.966519] ht_irqdisable = 46
[   30.983821] Si3226x Channel = 0 using PCM slot = 0
[   30.993619] SiVoice_SWInitChan (Ch = 0) Type = 28
[   31.005941] ProSLIC_VerifyControlInterface ret = 20
[   31.020455] Si3226x Channel = 1 using PCM slot = 1
[   31.030180] SiVoice_SWInitChan (Ch = 1) Type = 28
[   31.079413] Start TAPI_LL_Phone_Init pDev->nDevState = 00000020
[   31.092783] Si3226x: Si3226x_Init_MultiBOM for DCDC: LCQCUK. 
[   31.107678] SiLabs SLIC calibration disabled
[   31.113290] SiLabs Overwriting IRING limit 45 mA
[   31.122909] SiLabs Overwriting RTACTH limit to 32 mA
[   31.132859] SiLabs VBAT tracking is dissabled
[   31.144765] Si3226x: Channel 0 : Type = PROSLIC
[   31.151220] Si3226x: Channel 1 : Type = PROSLIC
[   31.156377] Si3226x: Channel 0 : Chip Type 28
[   31.160915] Si3226x: Channel 0 : Chip Rev 3
[   31.165714] Si3226x: Channel 1 : Chip Type 28
[   31.170197] Si3226x: Channel 1 : Chip Rev 3
[   31.176416] Si3226x: loading patch: 12062012
[   31.712025] Si3226x: loading patch: 12062012
[   33.781833] Si3226x: VBAT @ 50ms = 57.853 v (Vbath = = 59.985 v)
[   33.847494] Si3226x: VBAT Up = 57.853 v
[   33.851406] Si3226x: VBAT Up = 57.853 v
[   33.931492] Si3226x: VBAT @ 50ms = 57.644 v (Vbath = = 59.985 v)
[   33.997530] Si3226x: VBAT Up = 57.644 v
[   34.001454] Si3226x: VBAT Up = 57.644 v
[   34.725903] Si3226x: PCMStart
[   34.730883] Si3226x: PCMStart
[   34.745359] LOAD: cal_results1 = 29550182, cal_results2 = 31260672, cal_results3 = 1055129, cal_results4 = 937164
[   34.756281] Si3226x: Setting DC Feeding preset 0 on channel 0
[   35.028256]  ALM: Current Linefeed state already set to 1!
Event notify received, pvalue :4901 changed
APP: fd_ch[1/2]=/dev/fxs01
[   35.039079] Start TAPI_LL_Phone_Init pDev->nDevState = 0000E860
[   35.049958] VINETIC_Basic_VoIPConf Dev(0) Ch(1) cf048b3c
[   35.109613] Si3226x: PCMStart
[   35.114464] Si3226x: PCMStart
[   35.128773] LOAD: cal_results1 = 29550182, cal_results2 = 31260672, cal_results3 = 1055129, cal_results4 = 937164
[   35.139318] Si3226x: Setting DC Feeding preset 0 on channel 1
[   35.408124]  ALM: Current Linefeed state already set to 1!
Event notify received, pvalue :4902 changed
[   35.442083] ALM: RING FREQ: Dev/Ch (0/0) Ring frequency set to 20 Hz
[   35.515573] ALM: RING FREQ: Dev/Ch (0/1) Ring frequency set to 20 Hz
lib_dua_init
lib_dua_init dua_init returns 0
p_dua_InitRmAmReq: enMode=5 real_mode=0  arm_mode=0
css_log_task
p_dua_InitRmAmReq: return 0
lib_dua_init: p_dua_InitRmAmReq returns 0
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
lib_dua_init: dua_ep.fxs[0]=512 p_dua_UnitAllocateReq returns =0 
dua_coma_sync start
lib_dua_init: dua_ep.fxs[0]= 512 p_dua_UnitSetReq returns = 0
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
lib_dua_init: dua_ep.fxs[0] = 512 dua_ep.conn[0] = 0 p_dua_UnitConnectReq returns = 0
dua_coma_sync start
lib_dua_init: dua_ep.fxs[1]=513 p_dua_UnitAllocateReq returns =0 
dua_coma_sync start
lib_dua_init: dua_ep.fxs[1]= 513 p_dua_UnitSetReq returns = 0
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
lib_dua_init: dua_ep.fxs[1] = 513 dua_ep.conn[1] = 1 p_dua_UnitConnectReq returns = 0
dua_coma_sync start
dua_coma_sync start
dua_set_voip_mode: dua_ep.voip[0]=0 p_dua_UnitSetReq returns = 0
lib_dua_init: dua_ep.voip[0]=0 p_dua_UnitAllocateReq returns = 0
lib_dua_init: dua_ep.voip[0] = 0 dua_ep.conn[0] = 0 p_dua_UnitConnectReq returns = 0
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
dua_set_voip_mode: dua_ep.voip[1]=1 p_dua_UnitSetReq returns = 0
lib_dua_init: dua_ep.voip[1]=1 p_dua_UnitAllocateReq returns = 0
lib_dua_init: dua_ep.voip[1] = 1 dua_ep.conn[0] = 0 p_dua_UnitConnectReq returns = 0
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
dua_set_voip_mode: dua_ep.voip[2]=2 p_dua_UnitSetReq returns = 0
lib_dua_init: dua_ep.voip[2]=2 p_dua_UnitAllocateReq returns = 0
lib_dua_init: dua_ep.voip[2] = 2 dua_ep.conn[1] = 1 p_dua_UnitConnectReq returns = 0
dua_coma_sync start
dua_coma_sync start
dua_coma_sync start
dua_set_voip_mode: dua_ep.voip[3]=3 p_dua_UnitSetReq returns = 0
lib_dua_init: dua_ep.voip[3]=3 p_dua_UnitAllocateReq returns = 0
lib_dua_init: dua_ep.voip[3] = 3 dua_ep.conn[1] = 1 p_dua_UnitConnectReq returns = 0
dua_coma_sync start
chan_init:Enter
rtp_app_register: Mode=2  notify_opts=0x0  module_id=2
rtpapplibinit
RTPAPP: rtpapplibinit():2656:Initializing RTPAPP library 

p_rtpapp_Init : Enter
p_rtpapp_Init : auc_init done
p_rtpapp_Init : jib_init done
p_rtpapp_Init : duasync_init done
p_rtpapp_Init: Stage 1 inits
Creating shm PLC frame of size 80 for codec 46
Creating shm PLC frame of size 80 for codec 45
Creating shm PLC frame of size 40 for codec 49
Creating shm PLC frame of size 20 for codec -1
Creating shm PLC frame of size 24 for codec -1
Creating shm PLC frame of size 10 for codec 52
Creating shm PLC frame of size 80 for codec 47
Creating shm PLC frame of size 38 for codec 81
Creating shm PLC frame of size 50 for codec 80
Creating shm PLC frame of size 62 for codec 70
Creating shm PLC frame of size 40 for codec 49
Creating shm PLC frame of size 320 for codec 61
rtpapplibinit: done
RTPAPP: RTP_APP_Main():2490:Inside RTP APP Main

rtp_init
WARNING: no real random source present!
rtp_init: done
RTPAPP: RTP_APP_Main():2518: RTP-APP: initialization success 

 app_ses_id=2, msg_id=1, ses_idx=1, Status=1, err_code=0, data_len=0
RTPAPP: rtp_app_send_resp():340: RTP-APP: rtp_app_send_resp(): app_ses_id=2, msg-id=1, ses_idx=1, status=1, erro_code=0 

RTPAPP: rtp_app_proc_msgs_noproc():1923: RTP-APP: RTP_APP_REGISTER message processed - 2 

 Created the COMA Service 
rtp_app_register: done
dua_alloc_fxs: dua_ep.fxs[0]=512 p_dua_UnitAllocateReq returns =0 
dua_set_fxs_mode: dua_ep.fxs[0]= 512 p_dua_UnitSetReq returns = 0
dua_configure_fxs: Enter
dua_configure_fxs: Exit
dua_alloc_fxs: dua_ep.fxs[1]=513 p_dua_UnitAllocateReq returns =0 
dua_set_fxs_mode: dua_ep.fxs[1]= 513 p_dua_UnitSetReq returns = 0
dua_configure_fxs: Enter
dua_configure_fxs: Exit
dua_set_fxs_tdm: Enter
dua_coma_sync start
dua_set_fxs_tdm: sizeof(TDM_ASSIGNMENT_FXS) = 156, TDM assignment done
tdm_open_fxs
Move TDM ownership to CSS
chan_init:Exit
Event notify received, pvalue :4921 changed
Event notify received, pvalue :4922 changed
[   38.680491] Si3226x: EnableCID ch = 0
[   38.705051] Si3226x: EnableCID ch = 1
[   39.179116] Si3226x: DisableCID ch = 0
[   39.198276] Si3226x: DisableCID ch = 1
