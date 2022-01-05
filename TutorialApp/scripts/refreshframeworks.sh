#!/bin/bash
#
#  refreshframeworks.sh
#  Assistant
#
#  Copyright © 2018. SAP SE or an SAP affiliate company. All rights reserved.
#
#  No part of this publication may be reproduced or transmitted in any form or for any purpose
#  without the express permission of SAP SE.  The information contained herein may be changed
#  without prior notice.
#

# Usage:
#
# sh refreshframeworks.sh [PROJECT]
#
#   PROJECT: (optional) Directory where the project is available. Default: this project, so ./
#

FRAMEWORK_NAMES=( SAPCommon SAPFiori SAPFioriFlows SAPFoundation SAPOData SAPOfflineOData )
FRAMEWORK_LOCATION="/Users/Shared/SAPbtpSDKassistantForIOS-Resources/7.0.0/Release-xcframework/"

PROJECT="$1"

#
# No user serviceable parts below!
#

if [ -z "$PROJECT" ]; then
    export PROJECT="${PROJECT_DIR}/../Release-xcframework/"
fi

for i in ${FRAMEWORK_NAMES[@]}; do
    if [ ! -d "$PROJECT$i.xcframework" -a -d "$FRAMEWORK_LOCATION$i.xcframework" ]; then
        cp -R "$FRAMEWORK_LOCATION$i.xcframework" "$PROJECT"
    fi
done
