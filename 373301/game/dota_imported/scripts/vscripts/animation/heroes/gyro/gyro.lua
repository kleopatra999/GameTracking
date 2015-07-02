--============ Copyright (c) Valve Corporation, All rights reserved. ==========
--
-- source1import auto-generated animation script
-- local changes will be overwritten if source1import if run again on this asset
--
-- mdl: models\heroes\gyro\gyro.mdl
--
--=============================================================================

model:CreateWeightlist(
	"homing missile",
	{
		{ "bomb10_0", 1 }
	}
)

model:CreateWeightlist(
	"propellers",
	{
		{ "front_prop", 1 },
		{ "front_prop", 0 },
		{ "ft_prop16_0", 0 },
		{ "ft_prop16_1", 1 },
		{ "rear_prop18_1", 1 }
	}
)

model:CreateWeightlist(
	"attack",
	{
		{ "small_gun4_0_B_L", 1 },
		{ "small_gun5_0_B_R", 1 }
	}
)

model:CreateWeightlist(
	"jiggle",
	{
		{ "root", 1 },
		{ "spine1", 1 },
		{ "ft_prop16_1", 1 },
		{ "small_gun4_0_B_L", 0 },
		{ "rear_prop18_1", 1 },
		{ "small_gun5_0_B_R", 0 },
		{ "stick_l", 0 },
		{ "rocket_R_tip21_0", 0 },
		{ "stick_r", 0 },
		{ "rocket_L_tip24_0", 0 },
		{ "spine2", 0 },
		{ "wrist_L", 1 },
		{ "wrist_R", 1 },
		{ "clavicle_L", 1 },
		{ "clavicle_R", 1 }
	}
)

model:CreateWeightlist(
	"rocketbarrage",
	{
		{ "small_gun4_1_B_L", 1 },
		{ "small_gun5_1_B_R", 1 },
		{ "stick_l", 1 },
		{ "small_prop_L", 1 },
		{ "small_prop_R", 1 },
		{ "spine1", 1 },
		{ "stick_r", 1 }
	}
)


model:CreateSequence(
	{
		name = "abil1_rocket_barrage",
		sequences = {
			{ "@abil1_rocket_barrage" }
		},
		weightlist = "rocketbarrage",
		activities = {
			{ name = "ACT_DOTA_OVERRIDE_ABILITY_1", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "abil2_homing_missile",
		sequences = {
			{ "@abil2_homing_missile" }
		},
		weightlist = "homing missile",
		activities = {
			{ name = "ACT_DOTA_OVERRIDE_ABILITY_2", weight = 1 }
		}
	}
)



-- AsLookLayer
model:CreateSequence(
	{
		name = "@turns_lookFrame_0",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 0, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turns_lookFrame_1",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "@turns_lookFrame_2",
		snap = true,
		delta = true,
		hidden = true,
		cmds = {
			{ cmd = "fetchframe", sequence = "@turns", frame = 2, dst = 0 },
			{ cmd = "fetchframe", sequence = "@turns", frame = 1, dst = 1 },
			{ cmd = "subtract", dst = 0, src = 1 }
		}
	}
)

model:CreateSequence(
	{
		name = "turns",
		delta = true,
		poseParamX = model:CreatePoseParameter( "turn", -1, 1, 0, false ),
		sequences = {
			{ "@turns_lookFrame_0", "@turns_lookFrame_1", "@turns_lookFrame_2" }
		}
	}
)

-- AsTurningRun

model:CreateSequence(
	{
		name = "run",
		sequences = {
			{ "@run" }
		},
		addlayer = {
			"turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 5 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "run_aggressive",
		sequences = {
			{ "@run_aggressive" }
		},
		addlayer = {
			"turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "aggressive", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "run_roll",
		sequences = {
			{ "@run_roll" }
		},
		addlayer = {
			"turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 }
		}
	}
)


-- AsTurningRun

model:CreateSequence(
	{
		name = "injured_run",
		sequences = {
			{ "@injured_run" }
		},
		addlayer = {
			"turns"
		},
		activities = {
			{ name = "ACT_DOTA_RUN", weight = 1 },
			{ name = "injured", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "rattle_loop",
		framerangesequence = "@rattle_loop",
		cmds = {
			{ cmd = "sequence", sequence = "@rattle_loop", dst = 1 },
			{ cmd = "fetchframe", sequence = "@rattle_loop", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		weightlist = "jiggle",
		activities = {
			{ name = "ACT_DOTA_CONSTANT_LAYER", weight = 1 }
		}
	}
)


model:CreateSequence(
	{
		name = "rattle_loop_02",
		framerangesequence = "@rattle_loop_02",
		cmds = {
			{ cmd = "sequence", sequence = "@rattle_loop_02", dst = 1 },
			{ cmd = "fetchframe", sequence = "@rattle_loop_02", frame = 0, dst = 2 },
			{ cmd = "subtract", dst = 1, src = 2 },
			{ cmd = "add", dst = 0, src = 1 }
		},
		weightlist = "jiggle",
		activities = {
			{ name = "ACT_DOTA_CONSTANT_LAYER", weight = 1 }
		}
	}
)