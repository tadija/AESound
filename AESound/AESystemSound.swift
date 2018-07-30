/**
 *  https://github.com/tadija/AESystemSound
 *  Copyright (c) Marko Tadić 2018
 *  Licensed under the MIT license. See LICENSE file.
 */

import AudioToolbox

public struct AESystemSound {

    public static func play(_ path: AESystemSound.Path) {
        play(fromPath: path.rawValue)
    }

    public static func play(_ id: AESystemSound.ID) {
        play(withID: id.rawValue)
    }

    public static func play(fromPath path: String) {
        var id: SystemSoundID = 0
        let url = URL(fileURLWithPath: path)
        AudioServicesCreateSystemSoundID(url as CFURL, &id)
        play(withID: id)
    }
    
    public static func play(withID id: SystemSoundID) {
        AudioServicesPlaySystemSound(id)
    }

}

extension AESystemSound {
    public enum ID: UInt32 {
        case MailReceived__new_mail = 1000
        case MailSent__mail_sent = 1001
        case VoicemailReceived__Voicemail = 1002
        case SMSReceived__ReceivedMessage = 1003
        case SMSSent__SentMessage = 1004
        case CalendarAlert__alarm = 1005
        case LowPower__low_power = 1006
        case SMSReceived_Alert__sms_received1 = 1007
        case SMSReceived_Alert__sms_received2 = 1008
        case SMSReceived_Alert__sms_received3 = 1009
        case SMSReceived_Alert__sms_received4 = 1010
        case SMSReceived_Vibrate___ = 1011
        case SMSReceived_Alert__sms_received1_ = 1012
        case SMSReceived_Alert__sms_received5 = 1013
        case SMSReceived_Alert__sms_received6 = 1014
        case Random__Voicemail = 1015
        case SMSSent__tweet_sent = 1016
        case SMSReceived_Alert__Anticipate = 1020
        case SMSReceived_Alert__Bloom = 1021
        case SMSReceived_Alert__Calypso = 1022
        case SMSReceived_Alert__Choo_Choo = 1023
        case SMSReceived_Alert__Descent = 1024
        case SMSReceived_Alert__Fanfare = 1025
        case SMSReceived_Alert__Ladder = 1026
        case SMSReceived_Alert__Minuet = 1027
        case SMSReceived_Alert__News_Flash = 1028
        case SMSReceived_Alert__Noir = 1029
        case SMSReceived_Alert__Sherwood_Forest = 1030
        case SMSReceived_Alert__Spell = 1031
        case SMSReceived_Alert__Suspense = 1032
        case SMSReceived_Alert__Telegraph = 1033
        case SMSReceived_Alert__Tiptoes = 1034
        case SMSReceived_Alert__Typewriters = 1035
        case SMSReceived_Alert__Update = 1036
        case USSDAlert__ussd = 1050
        case SIMToolkitTone__SIMToolkitCallDropped = 1051
        case SIMToolkitTone__SIMToolkitGeneralBeep = 1052
        case SIMToolkitTone__SIMToolkitNegativeACK = 1053
        case SIMToolkitTone__SIMToolkitPositiveACK = 1054
        case SIMToolkitTone__SIMToolkitSMS = 1055
        case PINKeyPressed__Tink = 1057
        case AudioToneBusy__ct_busy = 1070
        case AudioToneCongestion__ct_congestion = 1071
        case AudioTonePathAcknowledge__ct_path_ack = 1072
        case AudioToneError__ct_error = 1073
        case AudioToneCallWaiting__ct_call_waiting = 1074
        case AudioToneKey2__ct_keytone2 = 1075
        case ScreenLocked__lock = 1100
        case ScreenUnlocked__unlock = 1101
        case FailedUnlock___ = 1102
        case KeyPressed__Tink = 1103
        case KeyPressed__Tock = 1104
        case KeyPressed__Tock_ = 1105
        case ConnectedToPower__beep_beep = 1106
        case RingerSwitchIndication__RingerChanged = 1107
        case CameraShutter__photoShutter = 1108
        case ShakeToShuffle__shake = 1109
        case JBL_Begin__jbl_begin = 1110
        case JBL_Confirm__jbl_confirm = 1111
        case JBL_Cancel__jbl_cancel = 1112
        case BeginRecording__begin_record = 1113
        case EndRecording__end_record = 1114
        case JBL_Ambiguous__jbl_ambiguous = 1115
        case JBL_NoMatch__jbl_no_match = 1116
        case BeginVideoRecording__begin_video_record = 1117
        case EndVideoRecording__end_video_record = 1118
        case VCInvitationAccepted__vc_invitation_accepted = 1150
        case VCRinging__vc_ringing = 1151
        case VCEnded__vc_ended = 1152
        case VCCallWaiting__ct_call_waiting = 1153
        case VCCallUpgrade__vc_ringing = 1154
        case TouchTone__dtmf_0 = 1200
        case TouchTone__dtmf_1 = 1201
        case TouchTone__dtmf_2 = 1202
        case TouchTone__dtmf_3 = 1203
        case TouchTone__dtmf_4 = 1204
        case TouchTone__dtmf_5 = 1205
        case TouchTone__dtmf_6 = 1206
        case TouchTone__dtmf_7 = 1207
        case TouchTone__dtmf_8 = 1208
        case TouchTone__dtmf_9 = 1209
        case TouchTone__dtmf_star = 1210
        case TouchTone__dtmf_pound = 1211
        case Headset_StartCall__long_low_short_high = 1254
        case Headset_Redial__short_double_high = 1255
        case Headset_AnswerCall__short_low_high = 1256
        case Headset_EndCall__short_double_low = 1257
        case Headset_CallWaitingActions__short_double_low = 1258
        case Headset_TransitionEnd__middle_9_short_double_low = 1259
        case SystemSoundPreview__Voicemail = 1300
        case SystemSoundPreview__ReceivedMessage = 1301
        case SystemSoundPreview__new_mail = 1302
        case SystemSoundPreview__mail_sent = 1303
        case SystemSoundPreview__alarm = 1304
        case SystemSoundPreview__lock = 1305
        case KeyPressClickPreview__Tock = 1306
        case SMSReceived_Selection__sms_received1 = 1307
        case SMSReceived_Selection__sms_received2 = 1308
        case SMSReceived_Selection__sms_received3 = 1309
        case SMSReceived_Selection__sms_received4 = 1310
        case SMSReceived_Vibrate____ = 1311
        case SMSReceived_Selection__sms_received1_ = 1312
        case SMSReceived_Selection__sms_received5 = 1313
        case SMSReceived_Selection__sms_received6 = 1314
        case SystemSoundPreview__Voicemail_ = 1315
        case SMSReceived_Selection__Anticipate = 1320
        case SMSReceived_Selection__Bloom = 1321
        case SMSReceived_Selection__Calypso = 1322
        case SMSReceived_Selection__Choo_Choo = 1323
        case SMSReceived_Selection__Descent = 1324
        case SMSReceived_Selection__Fanfare = 1325
        case SMSReceived_Selection__Ladder = 1326
        case SMSReceived_Selection__Minuet = 1327
        case SMSReceived_Selection__News_Flash = 1328
        case SMSReceived_Selection__Noir = 1329
        case SMSReceived_Selection__Sherwood_Forest = 1330
        case SMSReceived_Selection__Spell = 1331
        case SMSReceived_Selection__Suspense = 1332
        case SMSReceived_Selection__Telegraph = 1333
        case SMSReceived_Selection__Tiptoes = 1334
        case SMSReceived_Selection__Typewriters = 1335
        case SMSReceived_Selection__Update = 1336
        case RingerVibeChanged___ = 1350
        case SilentVibeChanged___ = 1351
        case Vibrate___ = 4095
    }
}

extension AESystemSound {
    public enum Path: String {
        case AudioToneBusy__ct_busy = "/System/Library/Audio/UISounds/ct-busy.caf"
        case AudioToneCallWaiting__ct_call_waiting = "/System/Library/Audio/UISounds/ct-call-waiting.caf"
        case AudioToneCongestion__ct_congestion = "/System/Library/Audio/UISounds/ct-congestion.caf"
        case AudioToneError__ct_error = "/System/Library/Audio/UISounds/ct-error.caf"
        case AudioToneKey2__ct_keytone2 = "/System/Library/Audio/UISounds/ct-keytone2.caf"
        case AudioTonePathAcknowledge__ct_path_ack = "/System/Library/Audio/UISounds/ct-path-ack.caf"
        case BeginRecording__begin_record = "/System/Library/Audio/UISounds/begin_record.caf"
        case BeginVideoRecording__begin_video_record = "/System/Library/Audio/UISounds/begin_video_record.caf"
        case CalendarAlert__alarm = "/System/Library/Audio/UISounds/alarm.caf"
        case CameraShutter__photoShutter = "/System/Library/Audio/UISounds/photoShutter.caf"
        case ConnectedToPower__beep_beep = "/System/Library/Audio/UISounds/beep-beep.caf"
        case EndRecording__end_record = "/System/Library/Audio/UISounds/end_record.caf"
        case EndVideoRecording__end_video_record = "/System/Library/Audio/UISounds/end_video_record.caf"
        case Headset_AnswerCall__short_low_high = "/System/Library/Audio/UISounds/short_low_high.caf"
        case Headset_EndCall__short_double_low = "/System/Library/Audio/UISounds/middle_9_short_double_low.caf"
        case Headset_Redial__short_double_high = "/System/Library/Audio/UISounds/short_double_high.caf"
        case Headset_StartCall__long_low_short_high = "/System/Library/Audio/UISounds/long_low_short_high.caf"
        case JBL_Ambiguous__jbl_ambiguous = "/System/Library/Audio/UISounds/jbl_ambiguous.caf"
        case JBL_Begin__jbl_begin = "/System/Library/Audio/UISounds/jbl_begin.caf"
        case JBL_Cancel__jbl_cancel = "/System/Library/Audio/UISounds/jbl_cancel.caf"
        case JBL_Confirm__jbl_confirm = "/System/Library/Audio/UISounds/jbl_confirm.caf"
        case JBL_NoMatch__jbl_no_match = "/System/Library/Audio/UISounds/jbl_no_match.caf"
        case KeyPressed__Tink = "/System/Library/Audio/UISounds/Tink.caf"
        case KeyPressed__Tock = "/System/Library/Audio/UISounds/Tock.caf"
        case LowPower__low_power = "/System/Library/Audio/UISounds/low_power.caf"
        case MailReceived__new_mail = "/System/Library/Audio/UISounds/new-mail.caf"
        case MailSent__mail_sent = "/System/Library/Audio/UISounds/mail-sent.caf"
        case Modern__airdrop_invite = "/System/Library/Audio/UISounds/Modern/airdrop_invite.caf"
        case Modern__calendar_alert_chord = "/System/Library/Audio/UISounds/Modern/calendar_alert_chord.caf"
        case Modern__camera_shutter_burst = "/System/Library/Audio/UISounds/Modern/camera_shutter_burst.caf"
        case Modern__camera_shutter_burst_begin = "/System/Library/Audio/UISounds/Modern/camera_shutter_burst_begin.caf"
        case Modern__camera_shutter_burst_end = "/System/Library/Audio/UISounds/Modern/camera_shutter_burst_end.caf"
        case Modern__sms_alert_aurora = "/System/Library/Audio/UISounds/Modern/sms_alert_aurora.caf"
        case Modern__sms_alert_bamboo = "/System/Library/Audio/UISounds/Modern/sms_alert_bamboo.caf"
        case Modern__sms_alert_circles = "/System/Library/Audio/UISounds/Modern/sms_alert_circles.caf"
        case Modern__sms_alert_complete = "/System/Library/Audio/UISounds/Modern/sms_alert_complete.caf"
        case Modern__sms_alert_hello = "/System/Library/Audio/UISounds/Modern/sms_alert_hello.caf"
        case Modern__sms_alert_input = "/System/Library/Audio/UISounds/Modern/sms_alert_input.caf"
        case Modern__sms_alert_keys = "/System/Library/Audio/UISounds/Modern/sms_alert_keys.caf"
        case Modern__sms_alert_note = "/System/Library/Audio/UISounds/Modern/sms_alert_note.caf"
        case Modern__sms_alert_popcorn = "/System/Library/Audio/UISounds/Modern/sms_alert_popcorn.caf"
        case Modern__sms_alert_synth = "/System/Library/Audio/UISounds/Modern/sms_alert_synth.caf"
        case Nano__3rdParty_DirectionDown_Haptic = "/System/Library/Audio/UISounds/nano/3rdParty_DirectionDown_Haptic.caf"
        case Nano__3rdParty_DirectionUp_Haptic = "/System/Library/Audio/UISounds/nano/3rdParty_DirectionUp_Haptic.caf"
        case Nano__3rdParty_Failure_Haptic = "/System/Library/Audio/UISounds/nano/3rdParty_Failure_Haptic.caf"
        case Nano__3rdParty_Retry_Haptic = "/System/Library/Audio/UISounds/nano/3rdParty_Retry_Haptic.caf"
        case Nano__3rdParty_Start_Haptic = "/System/Library/Audio/UISounds/nano/3rdParty_Start_Haptic.caf"
        case Nano__3rdParty_Stop_Haptic = "/System/Library/Audio/UISounds/nano/3rdParty_Stop_Haptic.caf"
        case Nano__3rdParty_Success_Haptic = "/System/Library/Audio/UISounds/nano/3rdParty_Success_Haptic.caf"
        case Nano__Alarm_Haptic = "/System/Library/Audio/UISounds/nano/Alarm_Haptic.caf"
        case Nano__Alarm_Nightstand_Haptic = "/System/Library/Audio/UISounds/nano/Alarm_Nightstand_Haptic.caf"
        case Nano__Alert_3rdParty_Haptic = "/System/Library/Audio/UISounds/nano/Alert_3rdParty_Haptic.caf"
        case Nano__Alert_3rdParty_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_3rdParty_Salient_Haptic.caf"
        case Nano__Alert_ActivityGoalAttained_Haptic = "/System/Library/Audio/UISounds/nano/Alert_ActivityGoalAttained_Haptic.caf"
        case Nano__Alert_ActivityGoalAttained_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_ActivityGoalAttained_Salient_Haptic.caf"
        case Nano__Alert_ActivityGoalBehind_Haptic = "/System/Library/Audio/UISounds/nano/Alert_ActivityGoalBehind_Haptic.caf"
        case Nano__Alert_ActivityGoalBehind_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_ActivityGoalBehind_Salient_Haptic.caf"
        case Nano__Alert_ActivityGoalClose_Haptic = "/System/Library/Audio/UISounds/nano/Alert_ActivityGoalClose_Haptic.caf"
        case Nano__Alert_BatteryLow_10p_Haptic = "/System/Library/Audio/UISounds/nano/Alert_BatteryLow_10p_Haptic.caf"
        case Nano__Alert_BatteryLow_5p_Haptic = "/System/Library/Audio/UISounds/nano/Alert_BatteryLow_5p_Haptic.caf"
        case Nano__Alert_BatteryLow_5p_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_BatteryLow_5p_Salient_Haptic.caf"
        case Nano__Alert_Calendar_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Calendar_Haptic.caf"
        case Nano__Alert_Calendar_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Calendar_Salient_Haptic.caf"
        case Nano__Alert_Mail_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Mail_Haptic.caf"
        case Nano__Alert_Mail_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Mail_Salient_Haptic.caf"
        case Nano__Alert_MapsDirectionsInApp_Haptic = "/System/Library/Audio/UISounds/nano/Alert_MapsDirectionsInApp_Haptic.caf"
        case Nano__Alert_Messages_1_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Messages_1_Haptic.caf"
        case Nano__Alert_Messages_1_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Messages_1_Salient_Haptic.caf"
        case Nano__Alert_Messages_2_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Messages_2_Haptic.caf"
        case Nano__Alert_Messages_3_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Messages_3_Haptic.caf"
        case Nano__Alert_PassbookBalance_Haptic = "/System/Library/Audio/UISounds/nano/Alert_PassbookBalance_Haptic.caf"
        case Nano__Alert_PassbookGeofence_Haptic = "/System/Library/Audio/UISounds/nano/Alert_PassbookGeofence_Haptic.caf"
        case Nano__Alert_PassbookGeofence_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_PassbookGeofence_Salient_Haptic.caf"
        case Nano__Alert_PhotostreamActivity_Haptic = "/System/Library/Audio/UISounds/nano/Alert_PhotostreamActivity_Haptic.caf"
        case Nano__Alert_ReminderDue_Haptic = "/System/Library/Audio/UISounds/nano/Alert_ReminderDue_Haptic.caf"
        case Nano__Alert_ReminderDue_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_ReminderDue_Salient_Haptic.caf"
        case Nano__Alert_Voicemail_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Voicemail_Haptic.caf"
        case Nano__Alert_Voicemail_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Alert_Voicemail_Salient_Haptic.caf"
        case Nano__Alert_WalkieTalkie_Haptic = "/System/Library/Audio/UISounds/nano/Alert_WalkieTalkie_Haptic.caf"
        case Nano__BatteryMagsafe_Haptic = "/System/Library/Audio/UISounds/nano/BatteryMagsafe_Haptic.caf"
        case Nano__Beat_Haptic = "/System/Library/Audio/UISounds/nano/Beat_Haptic.caf"
        case Nano__BuddyPairingFailure_Haptic = "/System/Library/Audio/UISounds/nano/BuddyPairingFailure_Haptic.caf"
        case Nano__BuddyPairingRemoteConnection_Haptic = "/System/Library/Audio/UISounds/nano/BuddyPairingRemoteConnection_Haptic.caf"
        case Nano__BuddyPairingRemoteTap_Haptic = "/System/Library/Audio/UISounds/nano/BuddyPairingRemoteTap_Haptic.caf"
        case Nano__BuddyPairingSuccess_Haptic = "/System/Library/Audio/UISounds/nano/BuddyPairingSuccess_Haptic.caf"
        case Nano__busy_tone_ansi = "/System/Library/Audio/UISounds/nano/busy_tone_ansi.caf"
        case Nano__busy_tone_cept = "/System/Library/Audio/UISounds/nano/busy_tone_cept.caf"
        case Nano__call_waiting_tone_ansi = "/System/Library/Audio/UISounds/nano/call_waiting_tone_ansi.caf"
        case Nano__call_waiting_tone_cept = "/System/Library/Audio/UISounds/nano/call_waiting_tone_cept.caf"
        case Nano__CameraCountdownImminent_Haptic = "/System/Library/Audio/UISounds/nano/CameraCountdownImminent_Haptic.caf"
        case Nano__CameraCountdownTick_Haptic = "/System/Library/Audio/UISounds/nano/CameraCountdownTick_Haptic.caf"
        case Nano__CameraShutter_Haptic = "/System/Library/Audio/UISounds/nano/CameraShutter_Haptic.caf"
        case Nano__ct_call_waiting = "/System/Library/Audio/UISounds/nano/ct-call-waiting.caf"
        case Nano__Detent_Haptic = "/System/Library/Audio/UISounds/nano/Detent_Haptic.caf"
        case Nano__DoNotDisturb_Haptic = "/System/Library/Audio/UISounds/nano/DoNotDisturb_Haptic.caf"
        case Nano__end_call_tone_cept = "/System/Library/Audio/UISounds/nano/end_call_tone_cept.caf"
        case Nano__ET_BeginNotification_Haptic = "/System/Library/Audio/UISounds/nano/ET_BeginNotification_Haptic.caf"
        case Nano__ET_BeginNotification_Salient_Haptic = "/System/Library/Audio/UISounds/nano/ET_BeginNotification_Salient_Haptic.caf"
        case Nano__ET_RemoteTap_Receive_Haptic = "/System/Library/Audio/UISounds/nano/ET_RemoteTap_Receive_Haptic.caf"
        case Nano__ET_RemoteTap_Send_Haptic = "/System/Library/Audio/UISounds/nano/ET_RemoteTap_Send_Haptic.caf"
        case Nano__Experimental_Orb1_Haptic = "/System/Library/Audio/UISounds/nano/Experimental_Orb1_Haptic.caf"
        case Nano__Experimental_Orb2_Haptic = "/System/Library/Audio/UISounds/nano/Experimental_Orb2_Haptic.caf"
        case Nano__Experimental_Orb3_Haptic = "/System/Library/Audio/UISounds/nano/Experimental_Orb3_Haptic.caf"
        case Nano__Experimental_Orb4_Haptic = "/System/Library/Audio/UISounds/nano/Experimental_Orb4_Haptic.caf"
        case Nano__Experimental_Orb5_Haptic = "/System/Library/Audio/UISounds/nano/Experimental_Orb5_Haptic.caf"
        case Nano__HourlyChime_Haptic = "/System/Library/Audio/UISounds/nano/HourlyChime_Haptic.caf"
        case Nano__MessagesIncoming_Haptic = "/System/Library/Audio/UISounds/nano/MessagesIncoming_Haptic.caf"
        case Nano__MessagesOutgoing_Haptic = "/System/Library/Audio/UISounds/nano/MessagesOutgoing_Haptic.caf"
        case Nano__NavigationGenericManeuver_Haptic = "/System/Library/Audio/UISounds/nano/NavigationGenericManeuver_Haptic.caf"
        case Nano__NavigationGenericManeuver_Salient_Haptic = "/System/Library/Audio/UISounds/nano/NavigationGenericManeuver_Salient_Haptic.caf"
        case Nano__NavigationLeftTurn_Haptic = "/System/Library/Audio/UISounds/nano/NavigationLeftTurn_Haptic.caf"
        case Nano__NavigationLeftTurn_Salient_Haptic = "/System/Library/Audio/UISounds/nano/NavigationLeftTurn_Salient_Haptic.caf"
        case Nano__NavigationRightTurn_Haptic = "/System/Library/Audio/UISounds/nano/NavigationRightTurn_Haptic.caf"
        case Nano__NavigationRightTurn_Salient_Haptic = "/System/Library/Audio/UISounds/nano/NavigationRightTurn_Salient_Haptic.caf"
        case Nano__Notification_Haptic = "/System/Library/Audio/UISounds/nano/Notification_Haptic.caf"
        case Nano__Notification_Salient_Haptic = "/System/Library/Audio/UISounds/nano/Notification_Salient_Haptic.caf"
        case Nano__OnOffPasscodeFailure_Haptic = "/System/Library/Audio/UISounds/nano/OnOffPasscodeFailure_Haptic.caf"
        case Nano__OnOffPasscodeUnlock_Haptic = "/System/Library/Audio/UISounds/nano/OnOffPasscodeUnlock_Haptic.caf"
        case Nano__OnOffPasscodeUnlockCampanion_Haptic = "/System/Library/Audio/UISounds/nano/OnOffPasscodeUnlockCampanion_Haptic.caf"
        case Nano__OrbExit_Haptic = "/System/Library/Audio/UISounds/nano/OrbExit_Haptic.caf"
        case Nano__OrbLayers_Haptic = "/System/Library/Audio/UISounds/nano/OrbLayers_Haptic.caf"
        case Nano__PhoneAnswer_Haptic = "/System/Library/Audio/UISounds/nano/PhoneAnswer_Haptic.caf"
        case Nano__PhoneHangUp_Haptic = "/System/Library/Audio/UISounds/nano/PhoneHangUp_Haptic.caf"
        case Nano__PhoneHold_Haptic = "/System/Library/Audio/UISounds/nano/PhoneHold_Haptic.caf"
        case Nano__PhotosZoomDetent_Haptic = "/System/Library/Audio/UISounds/nano/PhotosZoomDetent_Haptic.caf"
        case Nano__Preview_AudioAndHaptic = "/System/Library/Audio/UISounds/nano/Preview_AudioAndHaptic.caf"
        case Nano__QB_Dictation_Haptic = "/System/Library/Audio/UISounds/nano/QB_Dictation_Haptic.caf"
        case Nano__QB_Dictation_Off_Haptic = "/System/Library/Audio/UISounds/nano/QB_Dictation_Off_Haptic.caf"
        case Nano__ringback_tone_ansi = "/System/Library/Audio/UISounds/nano/ringback_tone_ansi.caf"
        case Nano__ringback_tone_aus = "/System/Library/Audio/UISounds/nano/ringback_tone_aus.caf"
        case Nano__ringback_tone_cept = "/System/Library/Audio/UISounds/nano/ringback_tone_cept.caf"
        case Nano__ringback_tone_hk = "/System/Library/Audio/UISounds/nano/ringback_tone_hk.caf"
        case Nano__Ringtone_UK_Haptic = "/System/Library/Audio/UISounds/nano/Ringtone_UK_Haptic.caf"
        case Nano__Ringtone_US_Haptic = "/System/Library/Audio/UISounds/nano/Ringtone_US_Haptic.caf"
        case Nano__RingtoneDucked_UK_Haptic = "/System/Library/Audio/UISounds/nano/RingtoneDucked_UK_Haptic.caf"
        case Nano__RingtoneDucked_US_Haptic = "/System/Library/Audio/UISounds/nano/RingtoneDucked_US_Haptic.caf"
        case Nano__SalientNotification_Haptic = "/System/Library/Audio/UISounds/nano/SalientNotification_Haptic.caf"
        case Nano__SedentaryTimer_Haptic = "/System/Library/Audio/UISounds/nano/SedentaryTimer_Haptic.caf"
        case Nano__SedentaryTimer_Salient_Haptic = "/System/Library/Audio/UISounds/nano/SedentaryTimer_Salient_Haptic.caf"
        case Nano__SiriStart_Haptic = "/System/Library/Audio/UISounds/nano/SiriStart_Haptic.caf"
        case Nano__SiriStopFailure_Haptic = "/System/Library/Audio/UISounds/nano/SiriStopFailure_Haptic.caf"
        case Nano__SiriStopSuccess_Haptic = "/System/Library/Audio/UISounds/nano/SiriStopSuccess_Haptic.caf"
        case Nano__Stockholm_Haptic = "/System/Library/Audio/UISounds/nano/Stockholm_Haptic.caf"
        case Nano__StockholmActive_Haptic = "/System/Library/Audio/UISounds/nano/StockholmActive_Haptic.caf"
        case Nano__StockholmActiveSingleCycle_Haptic = "/System/Library/Audio/UISounds/nano/StockholmActiveSingleCycle_Haptic.caf"
        case Nano__StockholmFailure_Haptic = "/System/Library/Audio/UISounds/nano/StockholmFailure_Haptic.caf"
        case Nano__StopwatchLap_Haptic = "/System/Library/Audio/UISounds/nano/StopwatchLap_Haptic.caf"
        case Nano__StopwatchReset_Haptic = "/System/Library/Audio/UISounds/nano/StopwatchReset_Haptic.caf"
        case Nano__StopwatchStart_Haptic = "/System/Library/Audio/UISounds/nano/StopwatchStart_Haptic.caf"
        case Nano__StopwatchStop_Haptic = "/System/Library/Audio/UISounds/nano/StopwatchStop_Haptic.caf"
        case Nano__SwTest1_Haptic = "/System/Library/Audio/UISounds/nano/SwTest1_Haptic.caf"
        case Nano__SystemStartup_Haptic = "/System/Library/Audio/UISounds/nano/SystemStartup_Haptic.caf"
        case Nano__Timer_Haptic = "/System/Library/Audio/UISounds/nano/Timer_Haptic.caf"
        case Nano__TimerCancel_Haptic = "/System/Library/Audio/UISounds/nano/TimerCancel_Haptic.caf"
        case Nano__TimerPause_Haptic = "/System/Library/Audio/UISounds/nano/TimerPause_Haptic.caf"
        case Nano__TimerStart_Haptic = "/System/Library/Audio/UISounds/nano/TimerStart_Haptic.caf"
        case Nano__TimerWheelHoursDetent_Haptic = "/System/Library/Audio/UISounds/nano/TimerWheelHoursDetent_Haptic.caf"
        case Nano__TimerWheelMinutesDetent_Haptic = "/System/Library/Audio/UISounds/nano/TimerWheelMinutesDetent_Haptic.caf"
        case Nano__UISwipe_Haptic = "/System/Library/Audio/UISounds/nano/UISwipe_Haptic.caf"
        case Nano__UISwitch_Off_Haptic = "/System/Library/Audio/UISounds/nano/UISwitch_Off_Haptic.caf"
        case Nano__UISwitch_On_Haptic = "/System/Library/Audio/UISounds/nano/UISwitch_On_Haptic.caf"
        case Nano__vc_ended = "/System/Library/Audio/UISounds/nano/vc~ended.caf"
        case Nano__vc_invitation_accepted = "/System/Library/Audio/UISounds/nano/vc~invitation-accepted.caf"
        case Nano__vc_ringing = "/System/Library/Audio/UISounds/nano/vc~ringing.caf"
        case Nano__VoiceOver_Click_Haptic = "/System/Library/Audio/UISounds/nano/VoiceOver_Click_Haptic.caf"
        case Nano__WalkieTalkieActiveEnd_Haptic = "/System/Library/Audio/UISounds/nano/WalkieTalkieActiveEnd_Haptic.caf"
        case Nano__WalkieTalkieActiveStart_Haptic = "/System/Library/Audio/UISounds/nano/WalkieTalkieActiveStart_Haptic.caf"
        case Nano__WorkoutComplete_Haptic = "/System/Library/Audio/UISounds/nano/WorkoutComplete_Haptic.caf"
        case Nano__WorkoutCountdown_Haptic = "/System/Library/Audio/UISounds/nano/WorkoutCountdown_Haptic.caf"
        case Nano__WorkoutPressStart_Haptic = "/System/Library/Audio/UISounds/nano/WorkoutPressStart_Haptic.caf"
        case Nano__WorkoutSaved_Haptic = "/System/Library/Audio/UISounds/nano/WorkoutSaved_Haptic.caf"
        case Nano__WorkoutSelect_Haptic = "/System/Library/Audio/UISounds/nano/WorkoutSelect_Haptic.caf"
        case Random__connect_power = "/System/Library/Audio/UISounds/connect_power.caf"
        case Random__focus_change_app_icon = "/System/Library/Audio/UISounds/focus_change_app_icon.caf"
        case Random__focus_change_keyboard = "/System/Library/Audio/UISounds/focus_change_keyboard.caf"
        case Random__focus_change_large = "/System/Library/Audio/UISounds/focus_change_large.caf"
        case Random__focus_change_small = "/System/Library/Audio/UISounds/focus_change_small.caf"
        case Random__keyboard_press_clear = "/System/Library/Audio/UISounds/keyboard_press_clear.caf"
        case Random__keyboard_press_delete = "/System/Library/Audio/UISounds/keyboard_press_delete.caf"
        case Random__keyboard_press_normal = "/System/Library/Audio/UISounds/keyboard_press_normal.caf"
        case Random__navigation_pop = "/System/Library/Audio/UISounds/navigation_pop.caf"
        case Random__navigation_push = "/System/Library/Audio/UISounds/navigation_push.caf"
        case Random__payment_failure = "/System/Library/Audio/UISounds/payment_failure.caf"
        case Random__payment_success = "/System/Library/Audio/UISounds/payment_success.caf"
        case Random__short_double_low = "/System/Library/Audio/UISounds/short_double_low.caf"
        case Random__Swish = "/System/Library/Audio/UISounds/Swish.caf"
        case Random__Voicemail = "/System/Library/Audio/UISounds/Voicemail.caf"
        case RingerSwitchIndication__RingerChanged = "/System/Library/Audio/UISounds/RingerChanged.caf"
        case ScreenLocked__lock = "/System/Library/Audio/UISounds/lock.caf"
        case ScreenUnlocked__unlock = "/System/Library/Audio/UISounds/unlock.caf"
        case ShakeToShuffle__shake = "/System/Library/Audio/UISounds/shake.caf"
        case SIMToolkitTone__SIMToolkitCallDropped = "/System/Library/Audio/UISounds/SIMToolkitCallDropped.caf"
        case SIMToolkitTone__SIMToolkitGeneralBeep = "/System/Library/Audio/UISounds/SIMToolkitGeneralBeep.caf"
        case SIMToolkitTone__SIMToolkitNegativeACK = "/System/Library/Audio/UISounds/SIMToolkitNegativeACK.caf"
        case SIMToolkitTone__SIMToolkitPositiveACK = "/System/Library/Audio/UISounds/SIMToolkitPositiveACK.caf"
        case SIMToolkitTone__SIMToolkitSMS = "/System/Library/Audio/UISounds/SIMToolkitSMS.caf"
        case SMSReceived__ReceivedMessage = "/System/Library/Audio/UISounds/ReceivedMessage.caf"
        case SMSReceived_Alert__Anticipate = "/System/Library/Audio/UISounds/New/Anticipate.caf"
        case SMSReceived_Alert__Bloom = "/System/Library/Audio/UISounds/New/Bloom.caf"
        case SMSReceived_Alert__Calypso = "/System/Library/Audio/UISounds/New/Calypso.caf"
        case SMSReceived_Alert__Choo_Choo = "/System/Library/Audio/UISounds/New/Choo_Choo.caf"
        case SMSReceived_Alert__Descent = "/System/Library/Audio/UISounds/New/Descent.caf"
        case SMSReceived_Alert__Fanfare = "/System/Library/Audio/UISounds/New/Fanfare.caf"
        case SMSReceived_Alert__Ladder = "/System/Library/Audio/UISounds/New/Ladder.caf"
        case SMSReceived_Alert__Minuet = "/System/Library/Audio/UISounds/New/Minuet.caf"
        case SMSReceived_Alert__News_Flash = "/System/Library/Audio/UISounds/New/News_Flash.caf"
        case SMSReceived_Alert__Noir = "/System/Library/Audio/UISounds/New/Noir.caf"
        case SMSReceived_Alert__Sherwood_Forest = "/System/Library/Audio/UISounds/New/Sherwood_Forest.caf"
        case SMSReceived_Alert__sms_received1 = "/System/Library/Audio/UISounds/sms-received1.caf"
        case SMSReceived_Alert__sms_received2 = "/System/Library/Audio/UISounds/sms-received2.caf"
        case SMSReceived_Alert__sms_received3 = "/System/Library/Audio/UISounds/sms-received3.caf"
        case SMSReceived_Alert__sms_received4 = "/System/Library/Audio/UISounds/sms-received4.caf"
        case SMSReceived_Alert__sms_received5 = "/System/Library/Audio/UISounds/sms-received5.caf"
        case SMSReceived_Alert__sms_received6 = "/System/Library/Audio/UISounds/sms-received6.caf"
        case SMSReceived_Alert__Spell = "/System/Library/Audio/UISounds/New/Spell.caf"
        case SMSReceived_Alert__Suspense = "/System/Library/Audio/UISounds/New/Suspense.caf"
        case SMSReceived_Alert__Telegraph = "/System/Library/Audio/UISounds/New/Telegraph.caf"
        case SMSReceived_Alert__Tiptoes = "/System/Library/Audio/UISounds/New/Tiptoes.caf"
        case SMSReceived_Alert__Typewriters = "/System/Library/Audio/UISounds/New/Typewriters.caf"
        case SMSReceived_Alert__Update = "/System/Library/Audio/UISounds/New/Update.caf"
        case SMSSent__SentMessage = "/System/Library/Audio/UISounds/SentMessage.caf"
        case SMSSent__tweet_sent = "/System/Library/Audio/UISounds/tweet_sent.caf"
        case TouchTone__dtmf_0 = "/System/Library/Audio/UISounds/dtmf-0.caf"
        case TouchTone__dtmf_1 = "/System/Library/Audio/UISounds/dtmf-1.caf"
        case TouchTone__dtmf_2 = "/System/Library/Audio/UISounds/dtmf-2.caf"
        case TouchTone__dtmf_3 = "/System/Library/Audio/UISounds/dtmf-3.caf"
        case TouchTone__dtmf_4 = "/System/Library/Audio/UISounds/dtmf-4.caf"
        case TouchTone__dtmf_5 = "/System/Library/Audio/UISounds/dtmf-5.caf"
        case TouchTone__dtmf_6 = "/System/Library/Audio/UISounds/dtmf-6.caf"
        case TouchTone__dtmf_7 = "/System/Library/Audio/UISounds/dtmf-7.caf"
        case TouchTone__dtmf_8 = "/System/Library/Audio/UISounds/dtmf-8.caf"
        case TouchTone__dtmf_9 = "/System/Library/Audio/UISounds/dtmf-9.caf"
        case TouchTone__dtmf_pound = "/System/Library/Audio/UISounds/dtmf-pound.caf"
        case TouchTone__dtmf_star = "/System/Library/Audio/UISounds/dtmf-star.caf"
        case USSDAlert__ussd = "/System/Library/Audio/UISounds/ussd.caf"
        case VCEnded__vc_ended = "/System/Library/Audio/UISounds/vc~ended.caf"
        case VCInvitationAccepted__vc_invitation_accepted = "/System/Library/Audio/UISounds/vc~invitation-accepted.caf"
        case VCRinging__vc_ringing = "/System/Library/Audio/UISounds/vc~ringing.caf"
    }
}
