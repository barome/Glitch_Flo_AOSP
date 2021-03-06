#!/sbin/sh

#Build config file
CONFIGFILE="/tmp/settings.conf"

#MINFREQ
MINF=`cat /tmp/aroma/minfreq.prop | cut -d '=' -f2`
echo -e "\n\n##### Minimum frequency #####\n# 1 162 MHz" >> $CONFIGFILE
echo -e "\n# 2 270 MHz\n# 3 384 MHz (stock)\n# 4 594 MHz\n# 5 810 MHz\n" >> $CONFIGFILE
if [ $MINF = 2 ]; then
  echo "MINF=2" >> $CONFIGFILE;
elif [ $MINF = 3 ]; then
  echo "MINF=3" >> $CONFIGFILE;
elif [ $MINF = 4 ]; then
  echo "MINF=4" >> $CONFIGFILE;
elif [ $MINF = 5 ]; then
  echo "MINF=5" >> $CONFIGFILE;
else
  echo "MINF=1" >> $CONFIGFILE;
fi

#S2W
S2W=`grep "item.0.1" /tmp/aroma/mods.prop | cut -d '=' -f2`
S2S=`grep "item.0.2" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Sweep2Wake Settings #####\n# 0 to disable sweep2wake" >> $CONFIGFILE
echo -e "# 1 to enable sweep2wake and sweep2sleep (default)\n# 2 to enable sweep2sleep and disable sweep2wake\n" >> $CONFIGFILE
if [ $S2W = 1 ]; then
  echo "SWEEP2WAKE=1" >> $CONFIGFILE;
elif [ $S2S = 1 ]; then
  echo "SWEEP2WAKE=2" >> $CONFIGFILE;
else
  echo "SWEEP2WAKE=0" >> $CONFIGFILE;
fi

#PWR_TOGGLE
PWR_TOGGLE=`grep "item.0.3" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### S2W/DT2W power button toggle Settings #####\n# 0 to disable S2W/DT2W power button toggle" >> $CONFIGFILE
echo -e "# 1 to enable S2W/DT2W power button toggle\n" >> $CONFIGFILE
if [ $PWR_TOGGLE = 1 ]; then
  echo "PWR_TOGGLE=1" >> $CONFIGFILE;
else
  echo "PWR_TOGGLE=0" >> $CONFIGFILE;
fi

#S2S_ORIENTATION
S2S_ORIENTATION=`cat /tmp/aroma/orientation.prop | cut -d '=' -f2`
echo -e "\n\n##### S2S orientation Settings #####\n# 0 for both" >> $CONFIGFILE
echo -e "# 1 for portrait only\n# 2 for landscape only\n" >> $CONFIGFILE
if [ $S2S_ORIENTATION = 2 ]; then
  echo "S2S_ORIENTATION=1" >> $CONFIGFILE;
elif [ $S2S_ORIENTATION = 3 ]; then
  echo "S2S_ORIENTATION=2" >> $CONFIGFILE;
else
  echo "S2S_ORIENTATION=0" >> $CONFIGFILE;
fi

#Shortsweep
SHORTSWEEP=`grep "item.0.4" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Shortsweep Settings #####\n# 0 to disable Shortsweep" >> $CONFIGFILE
echo -e "# 1 to enable Shortsweep\n" >> $CONFIGFILE
if [ $SHORTSWEEP = 1 ]; then
  echo "SHORTSWEEP=1" >> $CONFIGFILE;
else
  echo "SHORTSWEEP=0" >> $CONFIGFILE;
fi

#DT2W
DT2W=`grep "item.0.5" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### DoubleTap2Wake Settings #####\n# 0 to disable DoubleTap2Wake" >> $CONFIGFILE
echo -e "# 1 to enable DoubleTap2Wake\n" >> $CONFIGFILE
if [ $DT2W = 1 ]; then
  echo "DT2WAKE=1" >> $CONFIGFILE;
else
  echo "DT2WAKE=0" >> $CONFIGFILE;
fi

#Magnetic on/off
LID=`grep "item.0.6" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### Magnetic on/off Settings #####\n# 0 to disable Magnetic on/off" >> $CONFIGFILE
echo -e "# 1 to enable Magnetic on/off\n" >> $CONFIGFILE
if [ $LID = 1 ]; then
  echo "LID=0" >> $CONFIGFILE;
else
  echo "LID=1" >> $CONFIGFILE;
fi

#USB Host mode charging
OTGCM=`grep "item.0.7" /tmp/aroma/mods.prop | cut -d '=' -f2`
echo -e "\n\n##### USB OTG+Charge Settings ######\n# 1 to enable USB host mode charging\n# 0 to disable USB host mode charging\n" >> $CONFIGFILE
if [ $OTGCM = 1 ]; then
  echo "OTGCM=1" >> $CONFIGFILE;
else
  echo "OTGCM=0" >> $CONFIGFILE;
fi

#THERMAL
THERM=`cat /tmp/aroma/thermal.prop | cut -d '=' -f2`
echo -e "\n\n##### Thermal Settings #####\n# 0 for default thermal throttling" >> $CONFIGFILE
echo -e "# 1 to run cool\n# 2 to run hot\n" >> $CONFIGFILE
if [ $THERM = 1 ]; then
  echo "THERM=1" >> $CONFIGFILE;
elif [ $THERM = 3 ]; then
  echo "THERM=2" >> $CONFIGFILE;
else
  echo "THERM=0" >> $CONFIGFILE;
fi

#GPU Governor
GPU_GOV=`cat /tmp/aroma/gpugov.prop | cut -d '=' -f2`
echo -e "\n\n##### GPU Governor #####\n# 1 Ondemand (default)" >> $CONFIGFILE
echo -e "\n# 2 Simple\n# 3 Performance\n" >> $CONFIGFILE
if [ $GPU_GOV = 2 ]; then
  echo "GPU_GOV=2" >> $CONFIGFILE;
else
  echo "GPU_GOV=1" >> $CONFIGFILE;
fi

#Battery life extender
BLE=`cat /tmp/aroma/ble.prop | cut -d '=' -f2`
echo -e "\n\n##### Battery life eXtender #####\n# 1 4.3V (stock - 100%)" >> $CONFIGFILE
echo -e "\n# 2 4.2V (balanced - 93%)\n# 3 4.1V (conservative - 83%)\n# 4 4.0V (very conservative - 73%)\n" >> $CONFIGFILE
if [ $BLE = 2 ]; then
  echo "BLE=2" >> $CONFIGFILE;
elif [ $BLE = 3 ]; then
  echo "BLE=3" >> $CONFIGFILE;
elif [ $BLE = 4 ]; then
  echo "BLE=4" >> $CONFIGFILE;
else
  echo "BLE=1" >> $CONFIGFILE;
fi

echo -e "\n\n##############################" >> $CONFIGFILE
#END
