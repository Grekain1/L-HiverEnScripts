
instance DIA_Brian_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_EXIT_Condition;
	information = DIA_Brian_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_EXIT_Condition()
{
	if(Kapitel < 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_PICKPOCKET(C_Info)
{
	npc = VLK_457_Brian;
	nr = 900;
	condition = DIA_Brian_PICKPOCKET_Condition;
	information = DIA_Brian_PICKPOCKET_Info;
	permanent = TRUE;
	description = Pickpocket_60;
};


func int DIA_Brian_PICKPOCKET_Condition()
{
	return C_Beklauen(55,100);
};

func void DIA_Brian_PICKPOCKET_Info()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
	Info_AddChoice(DIA_Brian_PICKPOCKET,Dialog_Back,DIA_Brian_PICKPOCKET_BACK);
	Info_AddChoice(DIA_Brian_PICKPOCKET,DIALOG_PICKPOCKET,DIA_Brian_PICKPOCKET_DoIt);
};

func void DIA_Brian_PICKPOCKET_DoIt()
{
	B_Beklauen();
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};

func void DIA_Brian_PICKPOCKET_BACK()
{
	Info_ClearChoices(DIA_Brian_PICKPOCKET);
};


instance DIA_Brian_HALLO(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_HALLO_Condition;
	information = DIA_Brian_HALLO_Info;
	permanent = FALSE;
	important = TRUE;
};


func int DIA_Brian_HALLO_Condition()
{
	if(Npc_IsInState(self,ZS_Talk) && (self.aivar[AIV_TalkedToPlayer] == FALSE))
	{
		return TRUE;
	};
};

func void DIA_Brian_HALLO_Info()
{
	AI_Output(self,other,"DIA_Brian_HALLO_04_00");	//New in the city, huh? I'm Brian! I'm Master Harad's apprentice.
};


instance DIA_Brian_AboutLehrling(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_AboutLehrling_Condition;
	information = DIA_Brian_AboutLehrling_Info;
	permanent = FALSE;
	description = "What's it like to be the smith's apprentice?";
};


func int DIA_Brian_AboutLehrling_Condition()
{
	if((hero.guild == GIL_NONE) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutLehrling_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_00");	//What's it like to be the smith's apprentice?
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_01");	//Why do you ask? Do you want to be my successor?
	AI_Output(other,self,"DIA_Brian_AboutLehrling_15_02");	//Maybe.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_03");	//Why not... I'm almost done with my apprenticeship, and then I'm going to leave the city.
	AI_Output(self,other,"DIA_Brian_AboutLehrling_04_04");	//But not because of Harad. He is a good master - I have learned a lot from him.
};


instance DIA_Brian_WhyLeave(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_WhyLeave_Condition;
	information = DIA_Brian_WhyLeave_Info;
	permanent = FALSE;
	description = "Why do you want to leave the town?";
};


func int DIA_Brian_WhyLeave_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_WhyLeave_Info()
{
	AI_Output(other,self,"DIA_Brian_WhyLeave_15_00");	//Why do you want to leave the town?
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_00");	//Because the people here are getting on my nerves! Above all the other masters.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_01");	//I still remember what a fuss it was getting accepted as an apprentice with Harad.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_02");	//Really, every one of those jokers had something to say about it.
	AI_Output(self,other,"DIA_Brian_WhyLeave_04_03");	//I want to decide for myself who I can or can't take as an apprentice.
};


instance DIA_Brian_OtherMasters(C_Info)
{
	npc = VLK_457_Brian;
	nr = 1;
	condition = DIA_Brian_OtherMasters_Condition;
	information = DIA_Brian_OtherMasters_Info;
	permanent = FALSE;
	description = "Who are the other masters?";
};


func int DIA_Brian_OtherMasters_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_WhyLeave) && (Player_IsApprentice == APP_NONE))
	{
		return TRUE;
	};
};

func void DIA_Brian_OtherMasters_Info()
{
	AI_Output(other,self,"DIA_Brian_Add_15_00");	//Who are the other masters?
	AI_Output(self,other,"DIA_Brian_Add_04_01");	//Well, there's Thorben the carpenter, Bosper the bowmaker, Constantino the alchemist and Matteo.
	AI_Output(self,other,"DIA_Brian_Add_04_02");	//He sells armor, but first of all he's a merchant.
	AI_Output(self,other,"DIA_Brian_Add_04_03");	//All the masters have their houses here on the street.
	AI_Output(self,other,"DIA_Brian_Add_04_04");	//And Constantino's shop is in the underpass to the temple.
};


instance DIA_Brian_AboutHarad(C_Info)
{
	npc = VLK_457_Brian;
	nr = 2;
	condition = DIA_Brian_AboutHarad_Condition;
	information = DIA_Brian_AboutHarad_Info;
	permanent = FALSE;
	description = "Tell me more about Master Harad.";
};


func int DIA_Brian_AboutHarad_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_AboutLehrling))
	{
		return TRUE;
	};
};

func void DIA_Brian_AboutHarad_Info()
{
	AI_Output(other,self,"DIA_Brian_AboutHarad_15_00");	//Tell me more about Master Harad.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_01");	//He's not in a very good mood right now.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_02");	//A few days ago, the paladins came and ordered him to forge some swords for them.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_03");	//They've even forbidden him to sell swords to anyone else.
	AI_Output(self,other,"DIA_Brian_AboutHarad_04_04");	//Now he slaves day and night to finish the job as quickly as possible.
};


instance DIA_Brian_NEEDWEAPONS(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_NEEDWEAPONS_Condition;
	information = DIA_Brian_NEEDWEAPONS_Info;
	permanent = FALSE;
	description = "Can I buy weapons from you?";
};


func int DIA_Brian_NEEDWEAPONS_Condition()
{
	return TRUE;
};

func void DIA_Brian_NEEDWEAPONS_Info()
{
	AI_Output(other,self,"DIA_Brian_NEEDWEAPONS_15_00");	//Can I buy weapons from you?
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_01");	//Not really. I'm merely an assistant.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_02");	//The weapons that are made in this smithy are collected by the militia and taken to the towers, where they are stored.
	AI_Output(self,other,"DIA_Brian_NEEDWEAPONS_04_03");	//But if it has anything to do with forging, maybe I can help you.
};


var int Brian_Trade_einmal;

instance DIA_Brian_WASKAUFEN(C_Info)
{
	npc = VLK_457_Brian;
	nr = 4;
	condition = DIA_Brian_WASKAUFEN_Condition;
	information = DIA_Brian_WASKAUFEN_Info;
	permanent = TRUE;
	description = "What can I get from you?";
	trade = TRUE;
};


func int DIA_Brian_WASKAUFEN_Condition()
{
	if(Npc_KnowsInfo(other,DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_WASKAUFEN_Info()
{
	AI_Output(other,self,"DIA_Brian_WASKAUFEN_15_00");	//What can I get from you?
	b_clearsmithinv(self);
	B_GiveTradeInv(self);
	if(Npc_IsDead(Harad))
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_01");	//If I still have a couple of steel billets, you're welcome to them. That's all, I'm afraid.
		if(MIS_Jack_NewLighthouseOfficer == 0)
		{
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_02");	//Since Harad isn't here any more, the militia is keeping an eye on me.
			AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_03");	//I'm not allowed to continue running the smithy. They're afraid I'll just sell the whole thing and skedaddle.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Brian_WASKAUFEN_04_05");	//I can sell you some steel billets.
	};
	if(Brian_Trade_einmal == FALSE)
	{
		Log_CreateTopic(TOPIC_CityTrader,LOG_NOTE);
		B_LogEntry(TOPIC_CityTrader,"Brian, Harad's assistant, sells steel billets.");
		Brian_Trade_einmal = TRUE;
	};
	Npc_RemoveInvItems(self,ItMiSwordblade,Npc_HasItems(self,ItMiSwordblade));
};


instance DIA_BRIAN_TEACH_ORE(C_Info)
{
	npc = VLK_457_Brian;
	nr = 5;
	condition = dia_brian_teach_ore_condition;
	information = dia_brian_teach_ore_info;
	permanent = TRUE;
	description = "Can you teach me something?";
};


func int dia_brian_teach_ore_condition()
{
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		return TRUE;
	};
};

func void dia_brian_teach_ore_info()
{
	AI_Output(other,self,"DIA_Carl_Lernen_15_00");	//Can you teach me anything?
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		Info_ClearChoices(dia_brian_teach_ore);
		Info_AddChoice(dia_brian_teach_ore,Dialog_Back,dia_brian_teach_ore_back);
	};
	if(PLAYER_TALENT_OREMASTER[0] == FALSE)
	{
		Info_AddChoice(dia_brian_teach_ore,B_BuildLearnString("Ore extraction - Miner",B_GetLearnCostTalent(other,NPC_TALENT_OREMASTER,ORMASTERY_1)),dia_brian_teach_ore_ormastery_1);
	};
};

func void dia_brian_teach_ore_back()
{
	Info_ClearChoices(dia_brian_teach_ore);
};

func void dia_brian_teach_ore_ormastery_1()
{
	AI_Output(other,self,"DIA_Addon_Cavalorn_TEACH_15_00");	//I want to learn your abilities.
	b_teachplayertalentoremaster(self,other,ORMASTERY_1);
	Info_ClearChoices(dia_brian_teach_ore);
};


instance DIA_Brian_KAP3_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP3_EXIT_Condition;
	information = DIA_Brian_KAP3_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP3_EXIT_Condition()
{
	if(Kapitel == 3)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP3_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_RepairNecklace(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_RepairNecklace_Condition;
	information = DIA_Brian_RepairNecklace_Info;
	permanent = FALSE;
	description = "Can you repair jewelry?";
};


func int DIA_Brian_RepairNecklace_Condition()
{
	if((MIS_Bennet_InnosEyeRepairedSetting != LOG_SUCCESS) && (Npc_HasItems(other,ItMi_InnosEye_Broken_Mis) || (MIS_SCKnowsInnosEyeIsBroken == TRUE)))
	{
		return TRUE;
	};
};

func void DIA_Brian_RepairNecklace_Info()
{
	AI_Output(other,self,"DIA_Brian_RepairNecklace_15_00");	//Can you repair jewelry?
	AI_Output(self,other,"DIA_Brian_RepairNecklace_04_01");	//I'm just an assistant, I'm glad if I'm even allowed to make a dagger.
	if(Npc_IsDead(Harad) == FALSE)
	{
		AI_Output(self,other,"DIA_Brian_RepairNecklace_04_02");	//Jewelry? You'll have to ask the master.
	};
	MIS_SCKnowsInnosEyeIsBroken = TRUE;
};


instance DIA_Brian_KAP4_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP4_EXIT_Condition;
	information = DIA_Brian_KAP4_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP4_EXIT_Condition()
{
	if(Kapitel == 4)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP4_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_KAP5_EXIT(C_Info)
{
	npc = VLK_457_Brian;
	nr = 999;
	condition = DIA_Brian_KAP5_EXIT_Condition;
	information = DIA_Brian_KAP5_EXIT_Info;
	permanent = TRUE;
	description = Dialog_Ende;
};


func int DIA_Brian_KAP5_EXIT_Condition()
{
	if(Kapitel == 5)
	{
		return TRUE;
	};
};

func void DIA_Brian_KAP5_EXIT_Info()
{
	AI_StopProcessInfos(self);
};


instance DIA_Brian_NEWLIGHTHOUSEOFFICER(C_Info)
{
	npc = VLK_457_Brian;
	nr = 51;
	condition = DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition;
	information = DIA_Brian_NEWLIGHTHOUSEOFFICER_Info;
	description = "I heard that you are interested in Jack's old lighthouse.";
};


func int DIA_Brian_NEWLIGHTHOUSEOFFICER_Condition()
{
	if((Kapitel == 5) && (MIS_Jack_NewLighthouseOfficer == LOG_Running) && Npc_KnowsInfo(other,DIA_Brian_NEEDWEAPONS))
	{
		return TRUE;
	};
};

func void DIA_Brian_NEWLIGHTHOUSEOFFICER_Info()
{
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_00");	//I heard that you are interested in Jack's old lighthouse.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_01");	//Jack is considering going back to sea. But his lighthouse would be unguarded then.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_02");	//But it should be clear to Jack that I'll make a smithy out of his lighthouse when he isn't there.
	AI_Output(other,self,"DIA_Brian_NEWLIGHTHOUSEOFFICER_15_03");	//Is that a problem?
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_04");	//(laughs) Not to me. I won't get Harad's smithy anyway. I've put that thought right out of my head.
	AI_Output(self,other,"DIA_Brian_NEWLIGHTHOUSEOFFICER_04_05");	//Agreed. We'll meet at Jack's.
	MIS_Jack_NewLighthouseOfficer = LOG_SUCCESS;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Lighthouse");
};


instance DIA_Brian_LIGHTHOUSEFREE(C_Info)
{
	npc = VLK_457_Brian;
	nr = 8;
	condition = DIA_Brian_LIGHTHOUSEFREE_Condition;
	information = DIA_Brian_LIGHTHOUSEFREE_Info;
	permanent = TRUE;
	description = "So, what do you say?";
};


func int DIA_Brian_LIGHTHOUSEFREE_Condition()
{
	if((MIS_Jack_NewLighthouseOfficer == LOG_SUCCESS) && (Npc_GetDistToWP(self,"NW_LIGHTHOUSE_IN_01") < 1000) && (Kapitel == 5))
	{
		return TRUE;
	};
};

func void DIA_Brian_LIGHTHOUSEFREE_Info()
{
	AI_Output(other,self,"DIA_Brian_LIGHTHOUSEFREE_15_00");	//And, what do you say?
	AI_Output(self,other,"DIA_Brian_LIGHTHOUSEFREE_04_01");	//Lawdy, what a mess. Jack won't recognize the place when I'm done with it.
};

