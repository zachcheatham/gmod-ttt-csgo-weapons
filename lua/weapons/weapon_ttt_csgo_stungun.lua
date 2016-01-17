AddCSLuaFile()

SWEP.HoldType				= "ar2"

if CLIENT then
	SWEP.PrintName			= "UMP Prototype"
	SWEP.Slot				= 6

	SWEP.EquipMenuData = {
		type = "item_weapon",
		desc = "ump_desc"
    };

	SWEP.Icon				= "vgui/ttt/icon_ump"
end

SWEP.Base					= "weapon_ttt_csgo_base"
SWEP.Spawnable				= true

SWEP.Kind					= WEAPON_EQUIP
SWEP.CanBuy					= {ROLE_DETECTIVE}
SWEP.AutoSpawnable			= false
SWEP.LimitedStock = true

SWEP.Primary.Delay			= 0.1
SWEP.Primary.Recoil			= 1.2
SWEP.Primary.Automatic		= true
SWEP.Primary.Ammo			= "smg1"
SWEP.Primary.Damage			= 9
SWEP.Primary.Cone			= 0.02
SWEP.Primary.ClipSize		= 30
SWEP.Primary.ClipMax		= 60
SWEP.Primary.DefaultClip	= 30
SWEP.AmmoEnt				= "item_ammo_smg1_ttt"

SWEP.HeadshotMultiplier		= 4.5

SWEP.UseHands				= true
SWEP.ViewModelFlip			= false
SWEP.ViewModelFOV			= 56
SWEP.ViewModel				= "models/weapons/tfa_csgo/c_ump45.mdl"
SWEP.WorldModel				= "models/weapons/tfa_csgo/w_ump45.mdl"

SWEP.Primary.Sound			= Sound("TFA_CSGO_UMP45.1")

SWEP.IronSightsPos = Vector(-5.11, -12.664, 1.08)
SWEP.IronSightsAng = Vector(1.4, 0, 0)

SWEP.Offset = {
    Pos = {
        Up = -3.8,
        Right = 0.5,
        Forward = 6,
    },
    Ang = {
        Up = 0,
        Right = 80,
        Forward = 178
    },
    Scale = 1.1
}

function SWEP:ShootBullet( dmg, recoil, numbul, cone )
    local sights = self:GetIronsights()

    numbul = numbul or 1
    cone    = cone    or 0.01

    -- 10% accuracy bonus when sighting
    cone = sights and (cone * 0.9) or cone

    local bullet = {}
    bullet.Num     = numbul
    bullet.Src     = self.Owner:GetShootPos()
    bullet.Dir     = self.Owner:GetAimVector()
    bullet.Spread = Vector( cone, cone, 0 )
    bullet.Tracer = 4
    bullet.Force  = 5
    bullet.Damage = dmg

    bullet.Callback = function(att, tr, dmginfo)
                                if SERVER or (CLIENT and IsFirstTimePredicted()) then
                                    local ent = tr.Entity
                                    if (not tr.HitWorld) and IsValid(ent) then
                                        local edata = EffectData()

                                        edata:SetEntity(ent)
                                        edata:SetMagnitude(3)
                                        edata:SetScale(2)

                                        util.Effect("TeslaHitBoxes", edata)

                                        if SERVER and ent:IsPlayer() then
                                            local eyeang = ent:EyeAngles()

                                            local j = 10
                                            eyeang.pitch = math.Clamp(eyeang.pitch + math.Rand(-j, j), -90, 90)
                                            eyeang.yaw = math.Clamp(eyeang.yaw + math.Rand(-j, j), -90, 90)
                                            ent:SetEyeAngles(eyeang)
                                        end
                                    end
                                end
                            end


    self.Owner:FireBullets( bullet )
    self:SendWeaponAnim(self.PrimaryAnim)

    -- Owner can die after firebullets, giving an error at muzzleflash
    if not IsValid(self.Owner) or not self.Owner:Alive() then return end

    self.Owner:MuzzleFlash()
    self.Owner:SetAnimation( PLAYER_ATTACK1 )

    if self.Owner:IsNPC() then return end

    if ((game.SinglePlayer() and SERVER) or
         ((not game.SinglePlayer()) and CLIENT and IsFirstTimePredicted() )) then

        -- reduce recoil if ironsighting
        recoil = sights and (recoil * 0.75) or recoil

        local eyeang = self.Owner:EyeAngles()
        eyeang.pitch = eyeang.pitch - recoil
        self.Owner:SetEyeAngles( eyeang )

    end
end