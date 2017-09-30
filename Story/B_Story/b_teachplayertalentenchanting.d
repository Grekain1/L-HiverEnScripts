
func int b_teachplayertalentenchanting(var C_Npc slf,var C_Npc oth,var int enchantmastery)
{
	var int kosten;
	kosten = B_GetLearnCostTalent(oth,NPC_TALENT_ENCHANTING,enchantmastery);
	if(oth.lp < kosten)
	{
		PrintScreen(PRINT_NotEnoughLearnPoints,-1,-1,FONT_ScreenSmall,2);
		B_Say(slf,oth,"$NOLEARNNOPOINTS");
		return FALSE;
	};
	B_LogEntry(TOPIC_TalentAlchemy,"To enchant an item I need the base item and the ingredients required to make the enchant. Using these ingredients on the enchanter's table I can enchant the desired item.");
	oth.lp = oth.lp - kosten;
	Log_CreateTopic(TOPIC_TALENTENCHANTING,LOG_NOTE);
	if(enchantmastery == ENCHANTMASTERY_0)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ENCHANTING,1);
		PLAYER_TALENT_ENCHANTING[0] = TRUE;
		B_LogEntry(TOPIC_TALENTENCHANTING," ");
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ADDON_ENCHANT_1);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE01);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE02);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE03);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE04);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE05);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE06);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE07);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE08);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE09);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE10);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE11);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE12);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE13);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE14);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE15);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_NOVICE16);
		AI_PrintScreen("Learned: Enchanting - Novice",-1,52,FONT_SCREENBRIGHTLARGE,3);
	};
	if(enchantmastery == ENCHANTMASTERY_1)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ENCHANTING,2);
		PLAYER_TALENT_ENCHANTING[1] = TRUE;
		B_LogEntry(TOPIC_TALENTENCHANTING,"  ");
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ADDON_ENCHANT_2);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD01);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD02);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD03);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD04);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD05);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD06);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD07);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD08);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD09);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD10);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD11);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD12);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD13);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD14);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD15);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_WIZARD16);
		AI_PrintScreen("Learned: Enchanting - Wizard",-1,52,FONT_SCREENBRIGHTLARGE,3);
	};
	if(enchantmastery == ENCHANTMASTERY_2)
	{
		Npc_SetTalentSkill(oth,NPC_TALENT_ENCHANTING,3);
		PLAYER_TALENT_ENCHANTING[2] = TRUE;
		B_LogEntry(TOPIC_TALENTENCHANTING,"   ");
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ADDON_ENCHANT_3);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD01);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD02);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD03);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD04);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD05);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD06);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD07);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD08);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD09);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD10);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD11);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD12);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD13);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD14);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD15);
		B_LogEntry(TOPIC_TALENTENCHANTING,LOGTEXT_ENCH_MWIZARD16);
		AI_PrintScreen("Learned: Enchanting - Master Wizard",-1,52,FONT_SCREENBRIGHTLARGE,3);
	};
	return TRUE;
};

func int b_useenchanttable()
{
	if(Npc_GetTalentSkill(self,NPC_TALENT_MAGE) >= 1)
	{
		return TRUE;
	}
	else
	{
		AI_PrintScreen(PRINT_NoPicklockTalent,-1,50,FONT_ScreenSmall,1);
		AI_PlayAni(self,"T_DONTKNOW");
		B_Say_Overlay(self,self,"$BEZI_GOTOWY");
		return FALSE;
	};
};

