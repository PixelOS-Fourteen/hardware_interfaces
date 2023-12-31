/*
 * Copyright (C) 2022 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package android.hardware.usb.gadget;

@VintfStability
@Backing(type="int")
enum UsbSpeed {
    /**
     * UNKNOWN - Not Connected or Unsupported Speed
     */
    UNKNOWN = -1,

    /**
     * USB Low Speed
     */
    LOWSPEED = 0,

    /**
     * USB Full Speed
     */
    FULLSPEED = 1,

    /**
     * USB High Speed
     */
    HIGHSPEED = 2,

    /**
     * USB Super Speed
     */
    SUPERSPEED = 3,

    /**
     * USB Super Speed 10Gbps
     */
    SUPERSPEED_10Gb = 4,

    /**
     * USB Super Speed 20Gbps
     */
    SUPERSPEED_20Gb = 5,

    /**
     * USB4 Gen2 x 1 (10Gbps)
     */
    USB4_GEN2_10Gb = 6,

    /**
     * USB4 Gen2 x 2 (20Gbps)
     */
    USB4_GEN2_20Gb = 7,

    /**
     * USB4 Gen3 x 1 (20Gbps)
     */
    USB4_GEN3_20Gb = 8,

    /**
     * USB4 Gen3 x 2 (40Gbps)
     */
    USB4_GEN3_40Gb = 9,
}
