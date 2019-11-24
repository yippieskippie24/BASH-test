#!/bin/bash


#This file is used to check for root

function Root-check() {

  ## ROOT CHECK ##
  # Are we root? If not use sudo
  if [[ $EUID -eq 0 ]];then
      echo "You are root."
  else
      echo "Sudo will be used for the install."
      # Check if it is actually installed
      # If it isn't, exit because the install cannot complete
      if [[ $(dpkg-query -s sudo) ]];then
          export SUDO="sudo"
      else
          echo "Please install sudo or run this as root."
          exit 1
      fi
  fi




}
