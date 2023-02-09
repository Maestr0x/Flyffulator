<template>
  <div class="char">
    <h3>Your Equipment</h3>
    <div class="stats">
      <table class="stattable">

        <tr>
          <td><h5>Armor set</h5></td>
          <td>
            <select v-model="character.armor" id="equipment-select">
              <option disabled value="">Select an armor set...</option>
              <option v-for="set in armors" :value="set" :key="set.id">
                {{ set.name.en }}
              </option>
            </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.armor = null;character.armorUpgrade = null;character.armorBonus1 = null;character.armorBonus2 = null;character.armorBonus3= null;character.armorBonus4 = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Armor upgrade</h5></td>
          <td>
            <select v-model="character.armorUpgrade" id="equipment-select" :disabled=!character.armor>
              <option disabled value="">Select an upgrade level...</option>
              <option v-for="(e, i) in 11" :value="i" :key="i">
                +{{ i }}
              </option>
            </select>
          </td>
        </tr>

        <tr>
          <td><h5>Armor Bonus</h5></td>
          <td>
            <select v-model="character.armorBonus1" id="equipment-select" :disabled=!character.armor>
              <option disabled value="">Select a stats bonus...</option>
              <option v-for="stat in bonusStats" :value="stat" :key="stat.id">
                +{{ stat.abilities[0].add }} {{ stat.abilities[0].parameter }}
                {{ stat.abilities[1]?.add }} {{ stat.abilities[1]?.parameter }}
              </option>
            </select>
            <select v-model="character.armorBonus2" id="equipment-select" :disabled=!character.armorBonus1>
              <option disabled value="">Select a stats bonus...</option>
              <option v-for="stat in bonusStats" :value="stat" :key="stat.id">
                +{{ stat.abilities[0].add }} {{ stat.abilities[0].parameter }}
                {{ stat.abilities[1]?.add }} {{ stat.abilities[1]?.parameter }}
              </option>
            </select>
            <select v-model="character.armorBonus3" id="equipment-select" :disabled=!character.armorBonus2>
              <option disabled value="">Select a stats bonus...</option>
              <option v-for="stat in bonusStats" :value="stat" :key="stat.id">
                +{{ stat.abilities[0].add }} {{ stat.abilities[0].parameter }}
                {{ stat.abilities[1]?.add }} {{ stat.abilities[1]?.parameter }}
              </option>
            </select>
            <select v-model="character.armorBonus4" id="equipment-select" :disabled=!character.armorBonus3>
              <option disabled value="">Select a stats bonus...</option>
              <option v-for="stat in bonusStats" :value="stat" :key="stat.id">
                +{{ stat.abilities[0].add }} {{ stat.abilities[0].parameter }}
                {{ stat.abilities[1]?.add }} {{ stat.abilities[1]?.parameter }}
              </option>
            </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.armorBonus1 = null;character.armorBonus2 = null;character.armorBonus3= null;character.armorBonus4 = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Mainhand</h5></td>
          <td>
            <select v-model="character.mainhand" id="equipment-select">
              <option disabled value="">Select a weapon...</option>
              <option v-for="weapon in weapons" :value="weapon" :key="weapon.id">
                Lv. {{ weapon.level }} {{ weapon.name.en }}
              </option>
            </select>
          </td>
          <td></td>
        </tr>

        <tr>
          <td><h5>Mainhand upgrade</h5></td>
          <td>
            <select v-model="character.mainhandUpgrade" id="equipment-select">
              <option disabled value="">Select an upgrade level...</option>
              <option v-for="(e, i) in 11" :value="i" :key="i">
                +{{ i }}
              </option>
            </select>
          </td>
        </tr>

        <tr>
          <td><h5>Mainhand Bonus</h5></td>
          <td>
            <select v-model="character.weaponBonus1" id="equipment-select" :disabled=!character.mainhand>
              <option disabled value="">Select a stats bonus...</option>
              <option v-for="stat in bonusStats" :value="stat" :key="stat.id">
                +{{ stat.abilities[0].add }} {{ stat.abilities[0].parameter }}
                {{ stat.abilities[1]?.add }} {{ stat.abilities[1]?.parameter }}
              </option>
          </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.weaponBonus1 = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Offhand</h5></td>
          <td>
            <select v-model="character.offhand" id="equipment-select" :disabled=!canUseOffhand>
              <option disabled value="">Select an offhand...</option>
              <option v-for="offhand in offhands" :value="offhand" :key="offhand.id">
                Lv. {{ offhand.level }} {{ offhand.name.en }}
              </option>
          </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.offhand = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Offhand upgrade</h5></td>
          <td>
            <select v-model="character.offhandUpgrade" id="equipment-select" :disabled=!character.offhand>
              <option disabled value="">Select an upgrade level...</option>
              <option v-for="(e, i) in 11" :value="i" :key="i">
                +{{ i }}
              </option>
            </select>
          </td>
        </tr>

        <tr>
          <td><h5>Offhand Bonus</h5></td>
          <td>
            <select v-model="character.weaponBonus2" id="equipment-select" :disabled=!character.offhand>
              <option disabled value="">Select a stats bonus...</option>
              <option v-for="stat in bonusStats" :value="stat" :key="stat.id">
                +{{ stat.abilities[0].add }} {{ stat.abilities[0].parameter }}
                {{ stat.abilities[1]?.add }} {{ stat.abilities[1]?.parameter }}
              </option>
          </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.weaponBonus2 = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Earring</h5></td>
          <td>
            <select v-model="character.earringR" id="equipment-select">
              <option disabled value="">Select an earring...</option>
              <option v-for="earring in earrings" :value="earring" :key="earring.id">
                Lv. {{ earring.level }} {{ earring.name.en }}
              </option>
            </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.earringR = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Earring</h5></td>
          <td>
            <select v-model="character.earringL" id="equipment-select">
              <option disabled value="">Select an earring...</option>
              <option v-for="earring in earrings" :value="earring" :key="earring.id">
                Lv. {{ earring.level }} {{ earring.name.en }}
              </option>
            </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.earringL = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Necklace</h5></td>
          <td>
            <select v-model="character.necklace" id="equipment-select">
              <option disabled value="">Select a necklace...</option>
              <option v-for="necklace in necklaces" :value="necklace" :key="necklace.id">
                Lv. {{ necklace.level }} {{ necklace.name.en }}
              </option>
            </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.necklace = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Ring</h5></td>
          <td>
            <select v-model="character.ringR" id="equipment-select">
              <option disabled value="">Select a ring...</option>
              <option v-for="ring in rings" :value="ring" :key="ring.id">
                Lv. {{ ring.level }} {{ ring.name.en }}
              </option>
            </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.ringR = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Ring</h5></td>
          <td>
            <select v-model="character.ringL" id="equipment-select">
              <option disabled value="">Select a ring...</option>
              <option v-for="ring in rings" :value="ring" :key="ring.id">
                Lv. {{ ring.level }} {{ ring.name.en }}
              </option>
          </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.ringL = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Cloak</h5></td>
          <td>
            <select v-model="character.cloak" id="equipment-select">
              <option disabled value="">Select a cloak...</option>
              <option v-for="cloak in cloaks" :value="cloak" :key="cloak.id">
                {{ cloak.name.en }}
              </option>
            </select>
            {{ getCloakText(character.cloak) }}
          </td>
          <td>
            <button class="btn-plus" @click="character.cloak = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Pet</h5></td>
          <td>
            <select v-model="character.pet" id="equipment-select">
              <option disabled value="">Select a pet...</option>
              <option v-for="pet in pets" :value="pet" :key="pet.id">
                {{ pet.type }} <!--({{ pet.abilities[0].parameter }})-->
              </option>
            </select>
            <select v-model="character.pete" id="equipment-select" :disabled=!character.pet>
              <option disabled value="">Select a pet...</option>
              <option v-for="pete in computedpetes" :value="pete" :key="pete.id">
                Lv.{{ pete.grade }}: +{{ pete.abilities[0].add }} {{ pete.abilities[0].parameter }} 
              </option>
            </select>
            <select v-model="character.petd" id="equipment-select" :disabled=!character.pete>
              <option disabled value="">Select a pet...</option>
              <option v-for="petd in computedpetds" :value="petd" :key="petd.id">
                Lv.{{ petd.grade }}: +{{ petd.abilities[0].add }} {{ petd.abilities[0].parameter }} 
              </option>
            </select>
            <select v-model="character.petc" id="equipment-select" :disabled=!character.petd>
              <option disabled value="">Select a pet...</option>
              <option v-for="petc in computedpetcs" :value="petc" :key="petc.id">
                Lv.{{ petc.grade }}: +{{ petc.abilities[0].add }} {{ petc.abilities[0].parameter }} 
              </option>
            </select>
            <select v-model="character.petb" id="equipment-select" :disabled=!character.petc>
              <option disabled value="">Select a pet...</option>
              <option v-for="petb in computedpetbs" :value="petb" :key="petb.id">
                Lv.{{ petb.grade }}: +{{ petb.abilities[0].add }} {{ petb.abilities[0].parameter }} 
              </option>
            </select>
            <select v-model="character.peta" id="equipment-select" :disabled=!character.petb>
              <option disabled value="">Select a pet...</option>
              <option v-for="peta in computedpetas" :value="peta" :key="peta.id">
                Lv.{{ peta.grade }}: +{{ peta.abilities[0].add }} {{ peta.abilities[0].parameter }} 
              </option>
            </select>
            <select v-model="character.petx" id="equipment-select" :disabled=!character.peta>
              <option disabled value="">Select a pet...</option>
              <option v-for="petx in computedpetxs" :value="petx" :key="petx.id">
                Lv.{{ petx.grade }}: +{{ petx.abilities[0].add }} {{ petx.abilities[0].parameter }} 
              </option>
            </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.pet = null;character.pete = null;character.petd = null;character.petc = null;character.petb = null;character.peta = null;character.petx = null">x</button>
          </td>
        </tr> 

        <tr>
          <td><h5>Suit Piercing</h5></td>
          <td>
            <select v-model="character.suitPiercing1" id="equipment-select">
              <option disabled value="">Select a card...</option>
              <option v-for="card in piercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.suitPiercing2" id="equipment-select" :disabled=!character.suitPiercing1>
              <option disabled value="">Select a card...</option>
              <option v-for="card in piercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.suitPiercing3" id="equipment-select" :disabled=!character.suitPiercing2>
              <option disabled value="">Select a card...</option>
              <option v-for="card in piercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.suitPiercing4" id="equipment-select" :disabled=!character.suitPiercing3>
              <option disabled value="">Select a card...</option>
              <option v-for="card in piercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.suitPiercing1 = null;character.suitPiercing2 = null;character.suitPiercing3 = null;character.suitPiercing4 = null">x</button>
          </td>
        </tr>

        <tr>
          <td><h5>Weapon Piercing</h5></td>
          <td>
            <select v-model="character.weapPiercing1" id="equipment-select">
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
                {{ getCardText(character.card) }}
              </option>
          </select>
            <select v-model="character.weapPiercing2" id="equipment-select" :disabled=!character.weapPiercing1>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing3" id="equipment-select" :disabled=!character.weapPiercing2>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing4" id="equipment-select" :disabled=!character.weapPiercing3>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing5" id="equipment-select" :disabled=!character.weapPiercing4>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing6" id="equipment-select" :disabled=!character.weapPiercing5>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing7" id="equipment-select" :disabled=!character.weapPiercing6>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing8" id="equipment-select" :disabled=!character.weapPiercing7>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing9" id="equipment-select" :disabled=!character.weapPiercing8>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
            <select v-model="character.weapPiercing10" id="equipment-select" :disabled=!character.weapPiercing9>
              <option disabled value="">Select a card...</option>
              <option v-for="card in weapPiercingCards" :value="card" :key="card.id">
                {{ card.name.en }}
              </option>
          </select>
          </td>
          <td>
            <button class="btn-plus" @click="character.weapPiercing1 = null;character.weapPiercing2 = null;character.weapPiercing3 = null;character.weapPiercing4 = null;character.weapPiercing5 = null;character.weapPiercing6 = null;character.weapPiercing7 = null;character.weapPiercing8 = null;character.weapPiercing9 = null;character.weapPiercing10 = null">x</button>
          </td>
        </tr>

      </table>
    </div>
  </div>
</template>

<script>
import { Utils } from '../../calc/utils.js'
import { Blade } from '../../calc/jobs.js'

export default {
  name: 'Equipment',
  data() {
    return {
      character: this.$root.character.ref,
      weapons: [],
      armors: [],
      earrings: [],
      necklaces: [],
      rings: [],
      cloaks: [],
      pets: [],
      petes: [],
      petds: [],
      petcs: [],
      petbs: [],
      petas: [],
      petxs: [],
      bonusStats: [],
      weapPiercingCards: [],
      piercingCards: [],
      shields: [],
      offhands: [],
      canUseOffhand: true
    }
  },
  mounted() {
    this.updateEquipment();
    this.earrings = Utils.getJewelery("earring").sort(Utils.sortByName);
    this.rings = Utils.getJewelery("ring").sort(Utils.sortByName);
    this.necklaces = Utils.getJewelery("necklace").sort(Utils.sortByName);
    this.piercingCards = Utils.getPiercingCards().sort(Utils.sortByName);
    this.weapPiercingCards = Utils.getWeapPiercingCards().sort(Utils.sortByName);
    this.shields = Utils.getShields().sort(Utils.sortByLevel);
    this.cloaks = Utils.getCloaks().sort(Utils.sortByName);
    this.pets = Utils.getPets().sort(Utils.sortByName);
    this.petes = Utils.getPetes().sort(Utils.sortByName);
    this.petds = Utils.getPetds().sort(Utils.sortByName);
    this.petcs = Utils.getPetcs().sort(Utils.sortByName);
    this.petbs = Utils.getPetbs().sort(Utils.sortByName);
    this.petas = Utils.getPetas().sort(Utils.sortByName);
    this.petxs = Utils.getPetxs().sort(Utils.sortByName);
    this.bonusStats = Utils.getBonusStats().sort(Utils.sortByName);

    this.offhands = [...this.shields];
    if (this.character instanceof Blade) {
      this.offhands = this.offhands.concat(this.weapons);
    }
  },
  methods: {
    updateEquipment() {
      this.weapons = Utils.getJobWeapons(this.character.jobId).sort(Utils.sortByLevel);
      this.armors = Utils.getJobArmors(this.character.jobId).sort(Utils.sortByName);

      // Blades can use a shield or a weapon in their offhand
      if (this.character instanceof Blade) {
        this.offhands = [];
        this.offhands = [...this.shields];
        this.offhands = this.offhands.concat(this.weapons);
      }
    },
    applyEquip(equipment) {
      setTimeout(() => {
        this.character.armor = this.byId(this.armors, equipment.armor);
        this.character.armorUpgrade = equipment.armorUpgrade;
        this.character.mainhandUpgrade = equipment.mainhandUpgrade;
        this.character.offhandUpgrade = equipment.offhandUpgrade;
        this.character.mainhand = this.byId(this.weapons, equipment.mainhand) || Utils.getItemByName("Wooden Sword");
        this.character.offhand = this.byId(this.offhands.concat(this.weapons), equipment.offhand);
        this.character.earringR = this.byId(this.earrings, equipment.earringR);
        this.character.earringL = this.byId(this.earrings, equipment.earringL);
        this.character.necklace = this.byId(this.necklaces, equipment.necklace);
        this.character.ringR = this.byId(this.rings, equipment.ringR);
        this.character.ringL = this.byId(this.rings, equipment.ringL);
        this.character.cloak = this.byId(this.cloaks, equipment.cloak);
        this.character.pet = this.byId(this.pets, equipment.pet);
        this.character.pete = this.byId(this.petes, equipment.pete);
        this.character.petd = this.byId(this.petds, equipment.petd);
        this.character.petc = this.byId(this.petcs, equipment.petc);
        this.character.petb = this.byId(this.petbs, equipment.petb);
        this.character.peta = this.byId(this.petas, equipment.peta);
        this.character.petx = this.byId(this.petxs, equipment.petx);
        this.character.suitPiercing1 = this.byId(this.piercingCards, equipment.suitPiercing);
        this.character.suitPiercing2 = this.byId(this.piercingCards, equipment.suitPiercing);
        this.character.suitPiercing3 = this.byId(this.piercingCards, equipment.suitPiercing);
        this.character.suitPiercing4 = this.byId(this.piercingCards, equipment.suitPiercing);
        this.character.weapPiercing1 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing2 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing3 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing4 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing5 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing6 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing7 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing8 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing9 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.weapPiercing10 = this.byId(this.WeapPiercingCards, equipment.weapPiercing);
        this.character.armorBonus1 = this.byId(this.bonusStats, equipment.armorBonus);
        this.character.armorBonus2 = this.byId(this.bonusStats, equipment.armorBonus);
        this.character.armorBonus3 = this.byId(this.bonusStats, equipment.armorBonus);
        this.character.armorBonus4 = this.byId(this.bonusStats, equipment.armorBonus);
      }, 10);
    },
    byId(arr, id) {
      let obj = arr.find(o => o.id == id);
      return obj ?? null;
    },
    getCloakText(cloak) {
      let text = "";
      if(cloak) {
        //text = cloak.name.en + " (";
        cloak.abilities.forEach(ability => {
          let effect = " ";
          effect += ability.parameter;
          let add = ability.add;
          effect += "+" + add;
          if (ability.rate) effect += "%";
          effect += " ";
          text += effect;
        });
        //text += ")";   
      }
      return text;
    },
    getCardText(card) {
      let text = "";
      if(card) {
        //text = cloak.name.en + " (";
        card.abilities.forEach(ability => {
          let effect = " ";
          effect += ability.parameter;
          let add = ability.add;
          effect += "+" + add;
          if (ability.rate) effect += "%";
          effect += " ";
          text += effect;
        });
        //text += ")";   
      }
      return text;
    }
  },
  computed: {
    computedpetes: function() {
      return this.petes.filter(pete => !pete.type.indexOf(this.character.pet?.type))
    },
    computedpetds: function() {
      return this.petds.filter(petd => !petd.type.indexOf(this.character.pet?.type))
    },
    computedpetcs: function() {
      return this.petcs.filter(petc => !petc.type.indexOf(this.character.pet?.type))
    },
    computedpetbs: function() {
      return this.petbs.filter(petb => !petb.type.indexOf(this.character.pet?.type))
    },
    computedpetas: function() {
      return this.petas.filter(peta => !peta.type.indexOf(this.character.pet?.type))
    },
    computedpetxs: function() {
      return this.petxs.filter(petx => !petx.type.indexOf(this.character.pet?.type))
    }
  },
  watch: {
    '$root.character.ref'() {
      this.character = this.$root.character.ref;
      this.updateEquipment();
    },
    '$root.character.ref.mainhand'() {
      if (this.character.mainhand.twoHanded) {
        this.canUseOffhand = false;
        this.character.offhand = null;
      } else {
        this.canUseOffhand = true;
      }
    }
  }
}
</script>

<style scoped lang='scss'>
input[type=text] {
  width: auto;
  color: v-bind('$root.pcolor');
  border-radius: 10px;
  margin: auto 10px;
}

select#equipment-select {
  color: v-bind('$root.pcolor');
  margin-right: 20px;
  width: 140px;
  text-align: center;
}

select:disabled {
  opacity: 0.3;
}

button.btn-plus {
  padding: 0px 5px;
}
</style>
