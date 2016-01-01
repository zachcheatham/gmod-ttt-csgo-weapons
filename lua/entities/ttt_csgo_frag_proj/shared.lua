-- burning nade projectile

if SERVER then
    AddCSLuaFile("shared.lua")
end

ENT.Type = "anim"
ENT.Base = "ttt_basegrenade_proj"
ENT.Model = Model("models/weapons/tfa_csgo/w_frag.mdl")


AccessorFunc(ENT, "radius", "Radius", FORCE_NUMBER)
AccessorFunc(ENT, "dmg", "Dmg", FORCE_NUMBER)

function ENT:Initialize()
    if not self:GetRadius() then self:SetRadius(300) end
    if not self:GetDmg() then self:SetDmg(200) end

    return self.BaseClass.Initialize(self)
end

function ENT:Explode(tr)
    if SERVER then
        self.Entity:SetNoDraw(true)
        self.Entity:SetSolid(SOLID_NONE)

        if tr.Fraction != 1.0 then
            self.Entity:SetPos(tr.HitPos + tr.HitNormal * 0.6)
        end

        local pos = self.Entity:GetPos()

        if util.PointContents(pos) == CONTENTS_WATER then
            self:Remove()
            return
        end

        local effect = EffectData()
        effect:SetStart(pos)
        effect:SetOrigin(pos)
        effect:SetScale(self:GetRadius() * 0.3)
        effect:SetRadius(self:GetRadius())
        effect:SetMagnitude(self.dmg)

        if tr.Fraction != 1.0 then
            effect:SetNormal(tr.HitNormal)
        end

        util.Effect("Explosion", effect, true, true)

        util.BlastDamage(self, self:GetThrower(), pos, self:GetRadius(), self:GetDmg())

        self:SetDetonateExact(0)

        self:Remove()
    else
        local spos = self.Entity:GetPos()
        local trs = util.TraceLine({start=spos + Vector(0,0,64), endpos=spos + Vector(0,0,-128), filter=self})
        util.Decal("Scorch", trs.HitPos + trs.HitNormal, trs.HitPos - trs.HitNormal)        

        self:SetDetonateExact(0)
    end
end

function ENT:PhysicsCollide(data,phys)
	if data.Speed > 50 then
		self.Entity:EmitSound(Sound("HEGrenade.Bounce"))
	end
	
	local impulse = -data.Speed * data.HitNormal * .4 + (data.OurOldVelocity * -.3)
	phys:ApplyForceCenter(impulse)
end