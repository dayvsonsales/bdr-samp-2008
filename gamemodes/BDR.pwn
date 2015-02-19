/*______________________________________________________________________________
||                                                                            ||
||                        [BDR]RPG Rules Brasil™                              ||
||                                                                            ||
||                             [BDR] CLAN                                     ||
||                                                                            ||
||                     Criador do Game Mode: [BDR]Mac[BS]                     ||
||                                                                            ||
||					     Contato: rulesmac@msn.com              			  ||
||____________________________________________________________________________*/

#include <a_samp>
#include <dutils>
#include <dudbpirata>
#include <c_vehicleinfo>
#include <a_players>
#include <dini>
#include <core>
#include <float>
#include <a_objects>
#include <time>
#include <string>
#include <file>
#define bothipandidchat true //shows the ip and id when you chat
#define ipchat false //shows the ip when you chat
#define idchat false //shows id when you chat
#define noipandid false //shows no ip or id when you chat
#define SOM_MUSICA1 	                        1185 //Musica Rock
#define SOM_DESLIGADO                    		1184 //Musica desligada
#define SOM_MUSICA2                             1076 //Musica Minigame (A abelha)
#define SOM_ALARME                              1147 //Alarme de carro

//Cores do [BDR]RPG Rules Brasil™
#define COR_PRETO                 0x000000AA
#define COR_CINZA2 		  	      0xB4B5B7AA
#define COR_VERMELHO2             0xAA3333AA
#define COR_VERDE                 0x33AA33AA
#define COR_VERDE_AQUA            0x20B2AAAA
#define COR_VERMELHO              0xFF0000AA
#define COR_AMARELO               0xFFFF00AA
#define COR_PALHA            	  0xF0E68CAA
#define COR_BRANCO                0xFFFFFFAA
#define COR_CINZA                 0xAFAFAFAA
#define COR_NAO_LOGADO            0xFFFFFFAA
#define COR_PURPURA               0x330066AA
#define COR_PEDREIRA         	  0xBC8F8FAA
#define COR_ROSA             	  0xFF00FFAA
#define COR_ROSA2                 0xDDA0DDAA
#define COR_DESEMPREGADO          0xB4B5B7AA
#define COR_SORVETEIRO            0xD2691EAA
#define COR_HOT_DOG               0x808080AA
#define COR_MOTORISTA_DE_TREM     0x99D188AA
#define COR_PARAQUEDISTA          0xFFFFFFAA
#define COR_PADRE                 0xFFFFFFAA
#define COR_INSTRUTOR             0xDD0000FF
#define COR_TAXISTA               0xFFFF00AA
#define COR_RAPPER                0xB8860BAA
#define COR_COP_CIVIL             0x0000FFAA
#define COR_COP_ELITE             0x00C7FFAA
#define COR_CACADOR               0xA0522DAA
#define COR_ASSASSINO             0xAA3333AA
#define COR_VENDEDOR              0x009900AA
#define COR_AZUL 				  0x33CCFFAA
#define COR_COP_RODOVIARIO        0x00CED3AA
#define COR_SEGURANÇA             0xADD8E6AA
#define COR_BARMAN                0xF08080AA
#define COR_CORRETOR              0xDEB887AA
#define COR_PESCADOR              0xE9967AAA
#define COR_MOTORISTA             0xFF9900AA
#define COR_MOTORISTA_ONIBUS      0xF5F5DCAA
#define COR_JUIZ                  0x7FFF00AA
#define COR_TRAFICANTE            0xCD853FAA
#define COR_NARCOTICOS            0x057ABDAA
#define COR_POLICIA_FLORESTAL     0x45804FAA
#define COR_IBAMA                 0x1A4D23AA
#define COR_CAMINHONEIRO          0xE4E4E4AA
#define COR_ADVOGADO              0x462A4BAA
#define COR_VENDEDOR_DE_ARMAS     0x10F441AA
#define COR_GARI                  0x1F4B2BAA
#define COR_LADRAO_CARROS         0x6A95AEAA
#define COR_RECEITA_FEDERAL       0x5E3030AA
#define COR_MOTOBOY               0xFFC000AA
#define COR_AZULPLUS              0x4169FFAA
#define COR_LIMAO                 0xDDDD2357
#define COR_AGRICULTOR            0x99D188AA
#define COR_PRESIDENTE            0x69555AAA
#define COR_PREFEITO              0xF0E68CAA
#define COR_JORNALISTA            0x800080AA
#define COR_TAXI_AEREO            0xFFA500AA
#define COR_EXERCITO              0x575F04AA
#define COR_ENTREGADOR_PIZZA      0x99D188AA
#define COR_BOMBEIRO              0xb8ADBAAA
#define COR_MEDICO                0xD9E3E6FF
#define COR_EMPRENSA              0xA300FFAA
#define COR_BOXE                  0x330066AA
#define COR_COMERCIO              0xAD6670AA
#define COR_COP_SWAT              0x00C7FFAA
#define COR_TUNADOR               0x780C54FF
#define COR_FOTOGRAFO             0x8C6BA8FF
#define COR_MILITAR               0x6E3642FF
#define COR_COMERCIANTE           0xFF7D00FF
#define COR_DEPUTADO              0x4169FFAA
#define COR_FRENTISTA             0xCD853FAA
#define COR_MECANICO              0xC9C9E3FF
#define COR_APOSENTADO            0x008B8BAA
#define COR_MANOBRISTA            0x4F5E78FF
#define COR_COMERCIO              0xAD6670AA
#define COR_LADRAO                0x69555AAA
#define COR_BDR                   0x330066AA
#define COR_CHERIFE               0xAA3333AA
#define COR_COP_CORRUPTO          0xCD853FAA
#define COR_MATADOR_DE_ALUGUEL    0x1F4B2BAA
#define COR_HOTELEIRO             0xCD853FAA
#define COR_REI_DO_CRIME          0x69555AAA
#define COR_HOMEM_BOMBA           0x20B2AAAA
#define COR_ASSALTANTE            0xB70347AA
#define COR_MARINHA               0x1F4B2BAA
#define COR_FBI                   0xDDDD2357
#define COR_MOTORISTA_TREM        0x00FFFFAA
#define COR_CIA                   0x00C7FFAA
#define COR_SWAT                  0x00C7FFAA
#define COR_KGB                   0x057ABDAA
#define COR_SEQUESTRADOR          0xFFFFFFAA
#define COR_ALUGUEL_CARROS        0x660000AA
#define COR_GANG_RIFA             0x00FFFFAA
#define COR_DETETIVE              0xF0E300FF
#define COR_VL                    0x730000FF
#define COR_FISCAL_DETRAN         0xFFC0CBAA
#define COR_COP_MILITAR           0xFFA500AA

//Profissões do [BDR]RPG Rules Brasil™
#define DESEMPREGADO              1//Completa
#define TAXISTA                   2//Completa
#define VENDEDOR_DE_CARROS        3//Completa
#define CORRETOR                  4//Completa
#define ASSASSINO                 5//Completa
#define BARMAN                    6//Completa
#define JUIZ                      7//Completa
#define SEGURANÇA                 8//Completa
#define MOTORISTA_PARTICULAR      9//Completa
#define COP_CIVIL                 10//Completa
#define COP_RODOVIARIO            11//Completa
#define COP_ELITE                 12//Completa
#define CACADOR                   13//Completa
#define PESCADOR                  14//Completa
#define INSTRUTOR_DE_DIRECAO      15//Completa
#define TRAFICANTE                16//Completa
#define MOTORISTA_DE_ONIBUS       17//Completa
#define JORNALISTA                18//Completa
#define CAMINHONEIRO              19//Completa
#define NARCOTICOS                20//Completa
#define POLICIA_FLORESTAL         21//Completa
#define IBAMA                     22//Completa
#define ADVOGADO                  23//Completa
#define PARAMEDICO                24//Completa
#define SORVETEIRO                25//Completa
#define HOT_DOG                   26//Completa
#define MOTOBOY                   27//Completa
#define TAXISTA_AEREO             28//Completa
#define ENTREGADOR_PIZZA          29//Completa
#define PRESIDENTE                30//Completa
#define LADRAO_CARROS             31//Completa
#define PREFEITO                  32//Completa
#define AGRICULTOR                33//Completa
#define GOVERNADOR                34//Completa
#define DEPUTADO                  35//Completa
#define TUNADOR                   36//Completa
#define BDR                       37//Completa
#define EXERCITO                  38//Completa
#define CHERIFE                   39//Completa
#define COP_CORRUPTO              40//Completa
#define FOTOGRAFO                 41//Completa
#define MATADOR_DE_ALGUEL         42//Completa
#define HOTELEIRO                 43//Completa
#define REI_DO_CRIME              44//Completa
#define FRENTISTA                 45//Completa
#define PADRE                     46//Completa
#define BOMBEIRO                  47//Completa
#define RAPPER                    48//Completa
#define HOMEM_BOMBA               49//Completa
#define BOXE                      50//Completa
#define COMERCIO                  51//Completa
#define ASSALTANTE                52//Completa
#define MARINHA                   53//Completa
#define FBI                       54//Completa
#define MOTORISTA_TREM            55//Completa
#define CIA                       56//Completa
#define SWAT                      57//Completa
#define KGB                       58//Completa
#define GANG_RIFA                 59//Completa
#define DETETIVE                  60//Completa
#define VIDA_LOKA                 61//Completa
#define FISCAL_DETRAN             62//Completa
#define COP_MILITAR               63//Completa
#define VENDEDOR_DE_ARMAS         64//Completa

//[BDR]RPG Rules Brasil™, Defines do Velocímetro
#define MPS 			0
#define KMPH 			1
#define MPH 			2
#define KNOTS 			3
#define SPEED			KMPH

//Posições e news para float lista de jogadores login e área do banco para news e checkpoints
new Float:ppos[MAX_PLAYERS][101];
new PLAYERLIST_authed[MAX_PLAYERS];
new Log[MAX_PLAYERS];
new AreaBanco[MAX_PLAYERS];
//[BDR] RPG Rules Brasil™ área de pesca e comandos
new Piracema = 0;
new AreaCoopPesca[MAX_PLAYERS] = 0;
new PescaInProgress[MAX_PLAYERS] = 0;
new QtPescas[MAX_PLAYERS] = 0;
//Array Nome dos peixes
new NomePeixes[13][0] = {
{"Agulha"},
{"Albacora"},
{"Anequim"},
{"Atum"},
{"Bagre"},
{"Baiacú-Arara"},
{"Olho-de-boi"},
{"Linguado"},
{"Espadarte"},
{"Papa-Terra"},
{"Tubarão"},
{"Peixe-Espada"},
{"Anêmona"}
};
//[BDR]RPG Rules Brasil™ Missões (projeto nunca pensado nem começado)
//...
//[BDR] RPG Rules Brasil™ área da Fazenda
new AreaFazenda[MAX_PLAYERS] = 0;
new AreaCoopFazenda[MAX_PLAYERS] = 0;
new FazendaInProgress[MAX_PLAYERS] = 0;
new QtMilho[MAX_PLAYERS] = 0;
//[BDR]RPG Rules Brasil™ área de caça
new TemporadaCaca = 1;
new AreaCaca[MAX_PLAYERS] = 0;
new AreaCoopCaca[MAX_PLAYERS] = 0;
new CacaInProgress[MAX_PLAYERS] = 0;
new QtCacas[MAX_PLAYERS] = 0;

//[BDR]RPG Rules Brasil™ Checkpoints para os caminhoneiros
new AreaCarga[MAX_PLAYERS] = 0;
new AreaDescarga[MAX_PLAYERS] = 0;
new Carregamento[MAX_PLAYERS] = 0;

//[BDR]RPG Rules Brasil™ News diversos
new LoggedRcon[MAX_PLAYERS];
new carrotuning1;
new TempoAssalto[MAX_PLAYERS] = 0;
new Petrol[MAX_PLAYERS];
new AreaPosto[MAX_PLAYERS];
new Presos[MAX_PLAYERS] = 0;
new TempoPreso[MAX_PLAYERS] = 0;
new Profissao[MAX_PLAYERS] = 0;
new Procurados[MAX_PLAYERS] = 0;
new Taximetro[MAX_PLAYERS][4];
new ATaximetro[MAX_PLAYERS][4];
new MTaximetro[MAX_PLAYERS][4];
new PrecoCorrida[MAX_PLAYERS];
new worldTime;
new VeloMulta = 0;
new Velocidade[MAX_PLAYERS];
new Bebida[MAX_PLAYERS] = 0;
new Maconha[MAX_PLAYERS] = 0;
new Heroina[MAX_PLAYERS] = 0;
new Cocaina[MAX_PLAYERS] = 0;
//new cascbi;
//[BDR]RPG Rules Brasil™ Portões
new direcao;

//[BDR]RPG Rules Brasil™ Fowards
forward RTi();
forward remodcar(vehicleid);
forward OnVehicleSpawn(vehicleid);
forward Fazenda();
forward MoneyGrubScoreUpdate();
forward Bancos(playerid);
forward Pesca();
forward Caca();
forward CheckFuel();
forward LogarPlayer(playerid);
forward TempoPrisao();
forward Taxi();
forward ATaxi();
forward MTaxi();
forward Speed();
forward GetClosestHospital(playerid);
forward Tempo();
forward DestruirObjeto(objid);
forward CriarExplosao(Float:X,Float:Y,Float:Z,tipo,Float:diam);
forward Msg();
forward RandomMSGs();
forward PerfectVeh();
forward CountDown();
forward CountDownFreezing();
forward update_zones ();
//[BDR]RPG Rules Brasil™ Veículos statics

static VEH_MAVERICK = 487;
static VEH_PCJ600 = 461;
static VEH_RDTRAIN = 515;


//Zonas news
new zoneupdates[MAX_PLAYERS];
new player_zone[MAX_PLAYERS];
new zoneupdate;

enum zoneinfo {
	zone_name[27],
    Float:zone_minx,
    Float:zone_miny,
    Float:zone_minz,
    Float:zone_maxx,
    Float:zone_maxy,
    Float:zone_maxz
}
new Float:zones[][zoneinfo] = {
	{ "A GRANDE ORELHA",-410.00,1403.30,-3.00,-137.90,1681.20, 200.00},
	{ "Aldeia Malvada", -1372.10,2498.50, 0.00, -1277.50,2615.30, 200.00},
	{ "Angel Pine",-2324.90, -2584.20,-6.10, -1964.20, -2212.10, 200.00},
	{ "Arco del Oeste", -901.10,2221.80, 0.00,-592.00,2571.90, 200.00},
	{ "Avispa Country Club", -2646.40,-355.40, 0.00, -2270.00,-222.50, 200.00},
	{ "Avispa Country Club", -2831.80,-430.20,-6.10, -2646.40,-222.50, 200.00},
	{ "Avispa Country Club", -2361.50,-417.10, 0.00, -2270.00,-355.40, 200.00},
	{ "Avispa Country Club", -2667.80,-302.10, -28.80, -2646.40,-262.30,71.10},
	{ "Avispa Country Club", -2470.00,-355.40, 0.00, -2270.00,-318.40,46.10},
	{ "Avispa Country Club", -2550.00,-355.40, 0.00, -2470.00,-318.40,39.70},
	{ "Back o Beyond", -1166.90, -2641.10, 0.00,-321.70, -1856.00, 200.00},
	{ "Battery Point", -2741.00,1268.40,-4.50, -2533.00,1490.40, 200.00},
	{ "Bayside", -2741.00,2175.10, 0.00, -2353.10,2722.70, 200.00},
	{ "Bayside Marina",-2353.10,2275.70, 0.00, -2153.10,2475.70, 200.00},
	{ "Beacon Hill",-399.60, -1075.50,-1.40,-319.00,-977.50, 198.50},
	{ "Blackfield",964.30,1203.20, -89.00,1197.30,1403.20, 110.90},
	{ "Blackfield",964.30,1403.20, -89.00,1197.30,1726.20, 110.90},
	{ "Blackfield Chapel",1375.60, 596.30, -89.00,1558.00, 823.20, 110.90},
	{ "Blackfield Chapel",1325.60, 596.30, -89.00,1375.60, 795.00, 110.90},
	{ "Blackfield Intersection",1197.30,1044.60, -89.00,1277.00,1163.30, 110.90},
	{ "Blackfield Intersection",1166.50, 795.00, -89.00,1375.60,1044.60, 110.90},
	{ "Blackfield Intersection",1277.00,1044.60, -89.00,1315.30,1087.60, 110.90},
	{ "Blackfield Intersection",1375.60, 823.20, -89.00,1457.30, 919.40, 110.90},
	{ "Blueberry", 104.50,-220.10, 2.30, 349.60, 152.20, 200.00},
	{ "Blueberry",19.60,-404.10, 3.80, 349.60,-220.10, 200.00},
	{ "Blueberry Acres",-319.60,-220.10, 0.00, 104.50, 293.30, 200.00},
	{ "Palacio Caligula's",2087.30,1543.20, -89.00,2437.30,1703.20, 110.90},
	{ "Palacio Caligula's",2137.40,1703.20, -89.00,2437.30,1783.20, 110.90},
	{ "Calton Heights",-2274.10, 744.10,-6.10, -1982.30,1358.90, 200.00},
	{ "ChinaTown", -2274.10, 578.30,-7.60, -2078.60, 744.10, 200.00},
	{ "Prefeitura", -2867.80, 277.40,-9.10, -2593.40, 458.40, 200.00},
	{ "Come-A-Lot", 2087.30, 943.20, -89.00,2623.10,1203.20, 110.90},
	{ "Commerce", 1323.90, -1842.20, -89.00,1701.90, -1722.20, 110.90},
	{ "Commerce", 1323.90, -1722.20, -89.00,1440.90, -1577.50, 110.90},
	{ "Commerce", 1370.80, -1577.50, -89.00,1463.90, -1384.90, 110.90},
	{ "Commerce", 1463.90, -1577.50, -89.00,1667.90, -1430.80, 110.90},
	{ "Commerce", 1583.50, -1722.20, -89.00,1758.90, -1577.50, 110.90},
	{ "Commerce", 1667.90, -1577.50, -89.00,1812.60, -1430.80, 110.90},
	{ "Centro de Conferencias",1046.10, -1804.20, -89.00,1323.90, -1722.20, 110.90},
	{ "Centro de Conferencias",1073.20, -1842.20, -89.00,1323.90, -1804.20, 110.90},
	{ "Cranberry Station", -2007.80,56.30, 0.00, -1922.00, 224.70, 100.00},
	{ "Creek",2749.90,1937.20, -89.00,2921.60,2669.70, 110.90},
	{ "Dillimore", 580.70,-674.80,-9.50, 861.00,-404.70, 200.00},
	{ "Doherty", -2270.00,-324.10,-0.00, -1794.90,-222.50, 200.00},
	{ "Doherty", -2173.00,-222.50,-0.00, -1794.90, 265.20, 200.00},
	{ "Centro",-1982.30, 744.10,-6.10, -1871.70,1274.20, 200.00},
	{ "Centro",-1871.70,1176.40,-4.50, -1620.30,1274.20, 200.00},
	{ "Centro",-1700.00, 744.20,-6.10, -1580.00,1176.50, 200.00},
	{ "Centro",-1580.00, 744.20,-6.10, -1499.80,1025.90, 200.00},
	{ "Centro",-2078.60, 578.30,-7.60, -1499.80, 744.20, 200.00},
	{ "Centro",-1993.20, 265.20,-9.10, -1794.90, 578.30, 200.00},
	{ "Centro de Los Angeles",1463.90, -1430.80, -89.00,1724.70, -1290.80, 110.90},
	{ "Centro de Los Angeles",1724.70, -1430.80, -89.00,1812.60, -1250.90, 110.90},
	{ "Centro de Los Angeles",1463.90, -1290.80, -89.00,1724.70, -1150.80, 110.90},
	{ "Centro de Los Angeles",1370.80, -1384.90, -89.00,1463.90, -1170.80, 110.90},
	{ "Centro de Los Angeles",1724.70, -1250.90, -89.00,1812.60, -1150.80, 110.90},
	{ "Centro de Los Angeles",1370.80, -1170.80, -89.00,1463.90, -1130.80, 110.90},
	{ "Centro de Los Angeles",1378.30, -1130.80, -89.00,1463.90, -1026.30, 110.90},
	{ "Centro de Los Angeles",1391.00, -1026.30, -89.00,1463.90,-926.90, 110.90},
	{ "Centro de Los Angeles",1507.50, -1385.20, 110.90,1582.50, -1325.30, 335.90},
	{ "East Beach", 2632.80, -1852.80, -89.00,2959.30, -1668.10, 110.90},
	{ "East Beach", 2632.80, -1668.10, -89.00,2747.70, -1393.40, 110.90},
	{ "East Beach", 2747.70, -1668.10, -89.00,2959.30, -1498.60, 110.90},
	{ "East Beach", 2747.70, -1498.60, -89.00,2959.30, -1120.00, 110.90},
	{ "East Los Angeles",2421.00, -1628.50, -89.00,2632.80, -1454.30, 110.90},
	{ "East Los Angeles",2222.50, -1628.50, -89.00,2421.00, -1494.00, 110.90},
	{ "East Los Angeles",2266.20, -1494.00, -89.00,2381.60, -1372.00, 110.90},
	{ "East Los Angeles",2381.60, -1494.00, -89.00,2421.00, -1454.30, 110.90},
	{ "East Los Angeles",2281.40, -1372.00, -89.00,2381.60, -1135.00, 110.90},
	{ "East Los Angeles",2381.60, -1454.30, -89.00,2462.10, -1135.00, 110.90},
	{ "East Los Angeles",2462.10, -1454.30, -89.00,2581.70, -1135.00, 110.90},
	{ "Easter Basin",-1794.90, 249.90,-9.10, -1242.90, 578.30, 200.00},
	{ "Easter Basin",-1794.90, -50.00,-0.00, -1499.80, 249.90, 200.00},
	{ "Aeroporto Easter Bay",-1499.80, -50.00,-0.00, -1242.90, 249.90, 200.00},
	{ "Aeroporto Easter Bay",-1794.90,-730.10,-3.00, -1213.90, -50.00, 200.00},
	{ "Aeroporto Easter Bay",-1213.90,-730.10, 0.00, -1132.80, -50.00, 200.00},
	{ "Aeroporto Easter Bay",-1242.90, -50.00, 0.00, -1213.90, 578.30, 200.00},
	{ "Aeroporto Easter Bay",-1213.90, -50.00,-4.50,-947.90, 578.30, 200.00},
	{ "Aeroporto Easter Bay",-1315.40,-405.30,15.40, -1264.40,-209.50,25.40},
	{ "Aeroporto Easter Bay",-1354.30,-287.30,15.40, -1315.40,-209.50,25.40},
	{ "Aeroporto Easter Bay",-1490.30,-209.50,15.40, -1264.40,-148.30,25.40},
	{ "Easter Bay Chemicals",-1132.80,-768.00, 0.00,-956.40,-578.10, 200.00},
	{ "Easter Bay Chemicals",-1132.80,-787.30, 0.00,-956.40,-768.00, 200.00},
	{ "Garganta do Diabo", -464.50,2217.60, 0.00,-208.50,2580.30, 200.00},
	{ "Garganta do Diabo", -208.50,2123.00,-7.60, 114.00,2337.10, 200.00},
	{ "Garganta do Diabo", -208.50,2337.10, 0.00, 8.40,2487.10, 200.00},
	{ "El Corona",1812.60, -2179.20, -89.00,1970.60, -1852.80, 110.90},
	{ "El Corona",1692.60, -2179.20, -89.00,1812.60, -1842.20, 110.90},
	{ "El Quebrados",-1645.20,2498.50, 0.00, -1372.10,2777.80, 200.00},
	{ "Esplanade East",-1620.30,1176.50,-4.50, -1580.00,1274.20, 200.00},
	{ "Esplanade East",-1580.00,1025.90,-6.10, -1499.80,1274.20, 200.00},
	{ "Esplanade East",-1499.80, 578.30, -79.60, -1339.80,1274.20,20.30},
	{ "Esplanade North", -2533.00,1358.90,-4.50, -1996.60,1501.20, 200.00},
	{ "Esplanade North", -1996.60,1358.90,-4.50, -1524.20,1592.50, 200.00},
	{ "Esplanade North", -1982.30,1274.20,-4.50, -1524.20,1358.90, 200.00},
	{ "Fallen Tree",-792.20,-698.50,-5.30,-452.40,-380.00, 200.00},
	{ "Fallow Bridge", 434.30, 366.50, 0.00, 603.00, 555.60, 200.00},
	{ "Fern Ridge",508.10,-139.20, 0.00,1306.60, 119.50, 200.00},
	{ "Financial", -1871.70, 744.10,-6.10, -1701.30,1176.40, 300.00},
	{ "Fisher's Lagoon",1916.90,-233.30,-100.00,2131.70,13.80, 200.00},
	{ "Flint Intersection", -187.70, -1596.70, -89.00,17.00, -1276.60, 110.90},
	{ "Flint Range",-594.10, -1648.50, 0.00,-187.70, -1276.60, 200.00},
	{ "Fort Carson",-376.20, 826.30,-3.00, 123.70,1220.40, 200.00},
	{ "Foster Valley", -2270.00,-430.20,-0.00, -2178.60,-324.10, 200.00},
	{ "Foster Valley", -2178.60,-599.80,-0.00, -1794.90,-324.10, 200.00},
	{ "Foster Valley", -2178.60, -1115.50, 0.00, -1794.90,-599.80, 200.00},
	{ "Foster Valley", -2178.60, -1250.90, 0.00, -1794.90, -1115.50, 200.00},
	{ "Frederick Bridge", 2759.20, 296.50, 0.00,2774.20, 594.70, 200.00},
	{ "Golden Gate", -2741.40,1659.60,-6.10, -2616.40,2175.10, 200.00},
	{ "Golden Gate", -2741.00,1490.40,-6.10, -2616.40,1659.60, 200.00},
	{ "Ganton", 2222.50, -1852.80, -89.00,2632.80, -1722.30, 110.90},
	{ "Ganton", 2222.50, -1722.30, -89.00,2632.80, -1628.50, 110.90},
	{ "Garcia",-2411.20,-222.50,-0.00, -2173.00, 265.20, 200.00},
	{ "Garcia",-2395.10,-222.50,-5.30, -2354.00,-204.70, 200.00},
	{ "Ponte BDR", -1339.80, 828.10, -89.00, -1213.90,1057.00, 110.90},
	{ "Ponte BDR", -1213.90, 950.00, -89.00, -1087.90,1178.90, 110.90},
	{ "Ponte BDR", -1499.80, 696.40,-179.60, -1339.80, 925.30,20.30},
	{ "Glen Park",1812.60, -1449.60, -89.00,1996.90, -1350.70, 110.90},
	{ "Glen Park",1812.60, -1100.80, -89.00,1994.30,-973.30, 110.90},
	{ "Glen Park",1812.60, -1350.70, -89.00,2056.80, -1100.80, 110.90},
	{ "Green Palms", 176.50,1305.40,-3.00, 338.60,1520.70, 200.00},
	{ "Greenglass College",964.30,1044.60, -89.00,1197.30,1203.20, 110.90},
	{ "Greenglass College",964.30, 930.80, -89.00,1166.50,1044.60, 110.90},
	{ "Hampton Barns", 603.00, 264.30, 0.00, 761.90, 366.50, 200.00},
	{ "Hankypanky Point", 2576.90,62.10, 0.00,2759.20, 385.50, 200.00},
	{ "Harry Gold Parkway", 1777.30, 863.20, -89.00,1817.30,2342.80, 110.90},
	{ "Hashbury",-2593.40,-222.50,-0.00, -2411.20,54.70, 200.00},
	{ "Hilltop Farm",967.30,-450.30,-3.00,1176.70,-217.90, 200.00},
	{ "Hunter Quarry", 337.20, 710.80,-115.20, 860.50,1031.70, 203.70},
	{ "Idlewood", 1812.60, -1852.80, -89.00,1971.60, -1742.30, 110.90},
	{ "Idlewood", 1812.60, -1742.30, -89.00,1951.60, -1602.30, 110.90},
	{ "Idlewood", 1951.60, -1742.30, -89.00,2124.60, -1602.30, 110.90},
	{ "Idlewood", 1812.60, -1602.30, -89.00,2124.60, -1449.60, 110.90},
	{ "Idlewood", 2124.60, -1742.30, -89.00,2222.50, -1494.00, 110.90},
	{ "Idlewood", 1971.60, -1852.80, -89.00,2222.50, -1742.30, 110.90},
	{ "Jeferson",1996.90, -1449.60, -89.00,2056.80, -1350.70, 110.90},
	{ "Jeferson",2124.60, -1494.00, -89.00,2266.20, -1449.60, 110.90},
	{ "Jeferson",2056.80, -1372.00, -89.00,2281.40, -1210.70, 110.90},
	{ "Jeferson",2056.80, -1210.70, -89.00,2185.30, -1126.30, 110.90},
	{ "Jeferson",2185.30, -1210.70, -89.00,2281.40, -1154.50, 110.90},
	{ "Jeferson",2056.80, -1449.60, -89.00,2266.20, -1372.00, 110.90},
	{ "Julius Thruway East",2623.10, 943.20, -89.00,2749.90,1055.90, 110.90},
	{ "Julius Thruway East",2685.10,1055.90, -89.00,2749.90,2626.50, 110.90},
	{ "Julius Thruway East",2536.40,2442.50, -89.00,2685.10,2542.50, 110.90},
	{ "Julius Thruway East",2625.10,2202.70, -89.00,2685.10,2442.50, 110.90},
	{ "Julius Thruway North", 2498.20,2542.50, -89.00,2685.10,2626.50, 110.90},
	{ "Julius Thruway North", 2237.40,2542.50, -89.00,2498.20,2663.10, 110.90},
	{ "Julius Thruway North", 2121.40,2508.20, -89.00,2237.40,2663.10, 110.90},
	{ "Julius Thruway North", 1938.80,2508.20, -89.00,2121.40,2624.20, 110.90},
	{ "Julius Thruway North", 1534.50,2433.20, -89.00,1848.40,2583.20, 110.90},
	{ "Julius Thruway North", 1848.40,2478.40, -89.00,1938.80,2553.40, 110.90},
	{ "Julius Thruway North", 1704.50,2342.80, -89.00,1848.40,2433.20, 110.90},
	{ "Julius Thruway North", 1377.30,2433.20, -89.00,1534.50,2507.20, 110.90},
	{ "Julius Thruway South", 1457.30, 823.20, -89.00,2377.30, 863.20, 110.90},
	{ "Julius Thruway South", 2377.30, 788.80, -89.00,2537.30, 897.90, 110.90},
	{ "Julius Thruway West",1197.30,1163.30, -89.00,1236.60,2243.20, 110.90},
	{ "Julius Thruway West",1236.60,2142.80, -89.00,1297.40,2243.20, 110.90},
	{ "Juniper Hill",-2533.00, 578.30,-7.60, -2274.10, 968.30, 200.00},
	{ "Juniper Hollow",-2533.00, 968.30,-6.10, -2274.10,1358.90, 200.00},
	{ "K.A.C.C. Military Fuels",2498.20,2626.50, -89.00,2749.90,2861.50, 110.90},
	{ "Kincaid Bridge",-1339.80, 599.20, -89.00, -1213.90, 828.10, 110.90},
	{ "Kincaid Bridge",-1213.90, 721.10, -89.00, -1087.90, 950.00, 110.90},
	{ "Kincaid Bridge",-1087.90, 855.30, -89.00,-961.90, 986.20, 110.90},
	{ "King's",-2329.30, 458.40,-7.60, -1993.20, 578.30, 200.00},
	{ "King's",-2411.20, 265.20,-9.10, -1993.20, 373.50, 200.00},
	{ "King's",-2253.50, 373.50,-9.10, -1993.20, 458.40, 200.00},
	{ "LVA Freight Depot",1457.30, 863.20, -89.00,1777.40,1143.20, 110.90},
	{ "LVA Freight Depot",1375.60, 919.40, -89.00,1457.30,1203.20, 110.90},
	{ "LVA Freight Depot",1277.00,1087.60, -89.00,1375.60,1203.20, 110.90},
	{ "LVA Freight Depot",1315.30,1044.60, -89.00,1375.60,1087.60, 110.90},
	{ "LVA Freight Depot",1236.60,1163.40, -89.00,1277.00,1203.20, 110.90},
	{ "Las Barrancas",-926.10,1398.70,-3.00,-719.20,1634.60, 200.00},
	{ "Las Brujas", -365.10,2123.00,-3.00,-208.50,2217.60, 200.00},
	{ "Las Colinas",1994.30, -1100.80, -89.00,2056.80,-920.80, 110.90},
	{ "Las Colinas",2056.80, -1126.30, -89.00,2126.80,-920.80, 110.90},
	{ "Las Colinas",2185.30, -1154.50, -89.00,2281.40,-934.40, 110.90},
	{ "Las Colinas",2126.80, -1126.30, -89.00,2185.30,-934.40, 110.90},
	{ "Las Colinas",2747.70, -1120.00, -89.00,2959.30,-945.00, 110.90},
	{ "Las Colinas",2632.70, -1135.00, -89.00,2747.70,-945.00, 110.90},
	{ "Las Colinas",2281.40, -1135.00, -89.00,2632.70,-945.00, 110.90},
	{ "Las Payasadas",-354.30,2580.30, 2.00,-133.60,2816.80, 200.00},
	{ "Aeroporto de Las Vegas", 1236.60,1203.20, -89.00,1457.30,1883.10, 110.90},
	{ "Aeroporto de Las Vegas", 1457.30,1203.20, -89.00,1777.30,1883.10, 110.90},
	{ "Aeroporto de Las Vegas", 1457.30,1143.20, -89.00,1777.40,1203.20, 110.90},
	{ "Aeroporto de Las Vegas", 1515.80,1586.40, -12.50,1729.90,1714.50,87.50},
	{ "Last Dime Motel",1823.00, 596.30, -89.00,1997.20, 823.20, 110.90},
	{ "Leafy Hollow",-1166.90, -1856.00, 0.00,-815.60, -1602.00, 200.00},
	{ "LIL' PROBE INN",-90.20,1286.80,-3.00, 153.80,1554.10, 200.00},
	{ "Linden Side",2749.90, 943.20, -89.00,2923.30,1198.90, 110.90},
	{ "Linden Station", 2749.90,1198.90, -89.00,2923.30,1548.90, 110.90},
	{ "Linden Station", 2811.20,1229.50, -39.50,2861.20,1407.50,60.40},
	{ "Pequeno Mexico",1701.90, -1842.20, -89.00,1812.60, -1722.20, 110.90},
	{ "Pequeno Mexico",1758.90, -1722.20, -89.00,1812.60, -1577.50, 110.90},
	{ "Los Flores", 2581.70, -1454.30, -89.00,2632.80, -1393.40, 110.90},
	{ "Los Flores", 2581.70, -1393.40, -89.00,2747.70, -1135.00, 110.90},
	{ "Los Angeles International", 1249.60, -2394.30, -89.00,1852.00, -2179.20, 110.90},
	{ "Los Angeles International", 1852.00, -2394.30, -89.00,2089.00, -2179.20, 110.90},
	{ "Los Angeles International", 1382.70, -2730.80, -89.00,2201.80, -2394.30, 110.90},
	{ "Los Angeles International", 1974.60, -2394.30, -39.00,2089.00, -2256.50,60.90},
	{ "Los Angeles International", 1400.90, -2669.20, -39.00,2189.80, -2597.20,60.90},
	{ "Los Angeles International", 2051.60, -2597.20, -39.00,2152.40, -2394.30,60.90},
	{ "Marina",647.70, -1804.20, -89.00, 851.40, -1577.50, 110.90},
	{ "Marina",647.70, -1577.50, -89.00, 807.90, -1416.20, 110.90},
	{ "Marina",807.90, -1577.50, -89.00, 926.90, -1416.20, 110.90},
	{ "Mercado",787.40, -1416.20, -89.00,1072.60, -1310.20, 110.90},
	{ "Mercado",952.60, -1310.20, -89.00,1072.60, -1130.80, 110.90},
	{ "Mercado", 1072.60, -1416.20, -89.00,1370.80, -1130.80, 110.90},
	{ "Mercado",926.90, -1577.50, -89.00,1370.80, -1416.20, 110.90},
	{ "Market Station",787.40, -1410.90, -34.10, 866.00, -1310.20,65.80},
	{ "Martin Bridge",-222.10, 293.30, 0.00,-122.10, 476.40, 200.00},
	{ "Missionary Hill", -2994.40,-811.20, 0.00, -2178.60,-430.20, 200.00},
	{ "Montgomery", 1119.50, 119.50,-3.00,1451.40, 493.30, 200.00},
	{ "Montgomery", 1451.40, 347.40,-6.10,1582.40, 420.80, 200.00},
	{ "Montgomery Intersection",1546.60, 208.10, 0.00,1745.80, 347.40, 200.00},
	{ "Montgomery Intersection",1582.40, 347.40, 0.00,1664.60, 401.70, 200.00},
	{ "Mulholland", 1414.00,-768.00, -89.00,1667.60,-452.40, 110.90},
	{ "Mulholland", 1281.10,-452.40, -89.00,1641.10,-290.90, 110.90},
	{ "Mulholland", 1269.10,-768.00, -89.00,1414.00,-452.40, 110.90},
	{ "Mulholland", 1357.00,-926.90, -89.00,1463.90,-768.00, 110.90},
	{ "Mulholland", 1318.10,-910.10, -89.00,1357.00,-768.00, 110.90},
	{ "Mulholland", 1169.10,-910.10, -89.00,1318.10,-768.00, 110.90},
	{ "Mulholland",768.60,-954.60, -89.00, 952.60,-860.60, 110.90},
	{ "Mulholland",687.80,-860.60, -89.00, 911.80,-768.00, 110.90},
	{ "Mulholland",737.50,-768.00, -89.00,1142.20,-674.80, 110.90},
	{ "Mulholland", 1096.40,-910.10, -89.00,1169.10,-768.00, 110.90},
	{ "Mulholland",952.60,-937.10, -89.00,1096.40,-860.60, 110.90},
	{ "Mulholland",911.80,-860.60, -89.00,1096.40,-768.00, 110.90},
	{ "Mulholland",861.00,-674.80, -89.00,1156.50,-600.80, 110.90},
	{ "Mulholland Intersection",1463.90, -1150.80, -89.00,1812.60,-768.00, 110.90},
	{ "North Rock", 2285.30,-768.00, 0.00,2770.50,-269.70, 200.00},
	{ "Ocean Docks",2373.70, -2697.00, -89.00,2809.20, -2330.40, 110.90},
	{ "Ocean Docks",2201.80, -2418.30, -89.00,2324.00, -2095.00, 110.90},
	{ "Ocean Docks",2324.00, -2302.30, -89.00,2703.50, -2145.10, 110.90},
	{ "Ocean Docks",2089.00, -2394.30, -89.00,2201.80, -2235.80, 110.90},
	{ "Ocean Docks",2201.80, -2730.80, -89.00,2324.00, -2418.30, 110.90},
	{ "Ocean Docks",2703.50, -2302.30, -89.00,2959.30, -2126.90, 110.90},
	{ "Ocean Docks",2324.00, -2145.10, -89.00,2703.50, -2059.20, 110.90},
	{ "Ocean Flats", -2994.40, 277.40,-9.10, -2867.80, 458.40, 200.00},
	{ "Ocean Flats", -2994.40,-222.50,-0.00, -2593.40, 277.40, 200.00},
	{ "Ocean Flats", -2994.40,-430.20,-0.00, -2831.80,-222.50, 200.00},
	{ "Octane Springs",338.60,1228.50, 0.00, 664.30,1655.00, 200.00},
	{ "Old Vegas Strip", 2162.30,2012.10, -89.00,2685.10,2202.70, 110.90},
	{ "Palisades", -2994.40, 458.40,-6.10, -2741.00,1339.60, 200.00},
	{ "Palomino Creek", 2160.20,-149.00, 0.00,2576.90, 228.30, 200.00},
	{ "Paradiso",-2741.00, 793.40,-6.10, -2533.00,1268.40, 200.00},
	{ "Pershing Square",1440.90, -1722.20, -89.00,1583.50, -1577.50, 110.90},
	{ "Pilgrim",2437.30,1383.20, -89.00,2624.40,1783.20, 110.90},
	{ "Pilgrim",2624.40,1383.20, -89.00,2685.10,1783.20, 110.90},
	{ "Pilson Intersection",1098.30,2243.20, -89.00,1377.30,2507.20, 110.90},
	{ "Pirates in Men's Pants", 1817.30,1469.20, -89.00,2027.40,1703.20, 110.90},
	{ "Playa del Seville",2703.50, -2126.90, -89.00,2959.30, -1852.80, 110.90},
	{ "Prickle Pine", 1534.50,2583.20, -89.00,1848.40,2863.20, 110.90},
	{ "Prickle Pine", 1117.40,2507.20, -89.00,1534.50,2723.20, 110.90},
	{ "Prickle Pine", 1848.40,2553.40, -89.00,1938.80,2863.20, 110.90},
	{ "Prickle Pine", 1938.80,2624.20, -89.00,2121.40,2861.50, 110.90},
	{ "Queens",-2533.00, 458.40, 0.00, -2329.30, 578.30, 200.00},
	{ "Queens",-2593.40,54.70, 0.00, -2411.20, 458.40, 200.00},
	{ "Queens",-2411.20, 373.50, 0.00, -2253.50, 458.40, 200.00},
	{ "Randolph Industrial Estate", 1558.00, 596.30, -89.00,1823.00, 823.20, 110.90},
	{ "Redsands East",1817.30,2011.80, -89.00,2106.70,2202.70, 110.90},
	{ "Redsands East",1817.30,2202.70, -89.00,2011.90,2342.80, 110.90},
	{ "Redsands East",1848.40,2342.80, -89.00,2011.90,2478.40, 110.90},
	{ "Redsands West",1236.60,1883.10, -89.00,1777.30,2142.80, 110.90},
	{ "Redsands West",1297.40,2142.80, -89.00,1777.30,2243.20, 110.90},
	{ "Redsands West",1377.30,2243.20, -89.00,1704.50,2433.20, 110.90},
	{ "Redsands West",1704.50,2243.20, -89.00,1777.30,2342.80, 110.90},
	{ "Regular Tom",-405.70,1712.80,-3.00,-276.70,1892.70, 200.00},
	{ "Richman", 647.50, -1118.20, -89.00, 787.40,-954.60, 110.90},
	{ "Richman", 647.50,-954.60, -89.00, 768.60,-860.60, 110.90},
	{ "Richman", 225.10, -1369.60, -89.00, 334.50, -1292.00, 110.90},
	{ "Richman", 225.10, -1292.00, -89.00, 466.20, -1235.00, 110.90},
	{ "Richman",72.60, -1404.90, -89.00, 225.10, -1235.00, 110.90},
	{ "Richman",72.60, -1235.00, -89.00, 321.30, -1008.10, 110.90},
	{ "Richman", 321.30, -1235.00, -89.00, 647.50, -1044.00, 110.90},
	{ "Richman", 321.30, -1044.00, -89.00, 647.50,-860.60, 110.90},
	{ "Richman", 321.30,-860.60, -89.00, 687.80,-768.00, 110.90},
	{ "Richman", 321.30,-768.00, -89.00, 700.70,-674.80, 110.90},
	{ "Robada Intersection", -1119.00,1178.90, -89.00,-862.00,1351.40, 110.90},
	{ "Roca Escalante", 2237.40,2202.70, -89.00,2536.40,2542.50, 110.90},
	{ "Roca Escalante", 2536.40,2202.70, -89.00,2625.10,2442.50, 110.90},
	{ "Rockshore East", 2537.30, 676.50, -89.00,2902.30, 943.20, 110.90},
	{ "Rockshore West", 1997.20, 596.30, -89.00,2377.30, 823.20, 110.90},
	{ "Rockshore West", 2377.30, 596.30, -89.00,2537.30, 788.80, 110.90},
	{ "Rodeo",72.60, -1684.60, -89.00, 225.10, -1544.10, 110.90},
	{ "Rodeo",72.60, -1544.10, -89.00, 225.10, -1404.90, 110.90},
	{ "Rodeo", 225.10, -1684.60, -89.00, 312.80, -1501.90, 110.90},
	{ "Rodeo", 225.10, -1501.90, -89.00, 334.50, -1369.60, 110.90},
	{ "Rodeo", 334.50, -1501.90, -89.00, 422.60, -1406.00, 110.90},
	{ "Rodeo", 312.80, -1684.60, -89.00, 422.60, -1501.90, 110.90},
	{ "Rodeo", 422.60, -1684.60, -89.00, 558.00, -1570.20, 110.90},
	{ "Rodeo", 558.00, -1684.60, -89.00, 647.50, -1384.90, 110.90},
	{ "Rodeo", 466.20, -1570.20, -89.00, 558.00, -1385.00, 110.90},
	{ "Rodeo", 422.60, -1570.20, -89.00, 466.20, -1406.00, 110.90},
	{ "Rodeo", 466.20, -1385.00, -89.00, 647.50, -1235.00, 110.90},
	{ "Rodeo", 334.50, -1406.00, -89.00, 466.20, -1292.00, 110.90},
	{ "Royal Casino", 2087.30,1383.20, -89.00,2437.30,1543.20, 110.90},
	{ "Sons em San Andreas",2450.30, 385.50,-100.00,2759.20, 562.30, 200.00},
	{ "Santa Flora", -2741.00, 458.40,-7.60, -2533.00, 793.40, 200.00},
	{ "Santa Maria Beach", 342.60, -2173.20, -89.00, 647.70, -1684.60, 110.90},
	{ "Santa Maria Beach",72.60, -2173.20, -89.00, 342.60, -1684.60, 110.90},
	{ "Shady Cabin", -1632.80, -2263.40,-3.00, -1601.30, -2231.70, 200.00},
	{ "Shady Creeks",-1820.60, -2643.60,-8.00, -1226.70, -1771.60, 200.00},
	{ "Shady Creeks",-2030.10, -2174.80,-6.10, -1820.60, -1771.60, 200.00},
	{ "Sobell Rail Yards",2749.90,1548.90, -89.00,2923.30,1937.20, 110.90},
	{ "Spinybed", 2121.40,2663.10, -89.00,2498.20,2861.50, 110.90},
	{ "Starfish Casino",2437.30,1783.20, -89.00,2685.10,2012.10, 110.90},
	{ "Starfish Casino",2437.30,1858.10, -39.00,2495.00,1970.80,60.90},
	{ "Starfish Casino",2162.30,1883.20, -89.00,2437.30,2012.10, 110.90},
	{ "Templo", 1252.30, -1130.80, -89.00,1378.30, -1026.30, 110.90},
	{ "Templo", 1252.30, -1026.30, -89.00,1391.00,-926.90, 110.90},
	{ "Templo", 1252.30,-926.90, -89.00,1357.00,-910.10, 110.90},
	{ "Templo",952.60, -1130.80, -89.00,1096.40,-937.10, 110.90},
	{ "Templo", 1096.40, -1130.80, -89.00,1252.30, -1026.30, 110.90},
	{ "Templo", 1096.40, -1026.30, -89.00,1252.30,-910.10, 110.90},
	{ "The Camel's Toe",2087.30,1203.20, -89.00,2640.40,1383.20, 110.90},
	{ "The Clown's Pocket", 2162.30,1783.20, -89.00,2437.30,1883.20, 110.90},
	{ "The Emerald Isle", 2011.90,2202.70, -89.00,2237.40,2508.20, 110.90},
	{ "A Fazenda",-1209.60, -1317.10, 114.90,-908.10,-787.30, 251.90},
	{ "The Four Dragons Casino",1817.30, 863.20, -89.00,2027.30,1083.20, 110.90},
	{ "The High Roller",1817.30,1283.20, -89.00,2027.30,1469.20, 110.90},
	{ "The Mako Span",1664.60, 401.70, 0.00,1785.10, 567.20, 200.00},
	{ "The Panopticon", -947.90,-304.30,-1.10,-319.60, 327.00, 200.00},
	{ "The Pink Swan",1817.30,1083.20, -89.00,2027.30,1283.20, 110.90},
	{ "The Sherman Dam",-968.70,1929.40,-3.00,-481.10,2155.20, 200.00},
	{ "The Strip",2027.40, 863.20, -89.00,2087.30,1703.20, 110.90},
	{ "The Strip",2106.70,1863.20, -89.00,2162.30,2202.70, 110.90},
	{ "The Strip",2027.40,1783.20, -89.00,2162.30,1863.20, 110.90},
	{ "The Strip",2027.40,1703.20, -89.00,2137.40,1783.20, 110.90},
	{ "The Visage", 1817.30,1863.20, -89.00,2106.70,2011.80, 110.90},
	{ "The Visage", 1817.30,1703.20, -89.00,2027.40,1863.20, 110.90},
	{ "Unity Station",1692.60, -1971.80, -20.40,1812.60, -1932.80,79.50},
	{ "Vale Secreto",-936.60,2611.40, 2.00,-715.90,2847.90, 200.00},
	{ "Verdant Bluffs",930.20, -2488.40, -89.00,1249.60, -2006.70, 110.90},
	{ "Verdant Bluffs", 1073.20, -2006.70, -89.00,1249.60, -1842.20, 110.90},
	{ "Verdant Bluffs", 1249.60, -2179.20, -89.00,1692.60, -1842.20, 110.90},
	{ "Verdant Meadows",37.00,2337.10,-3.00, 435.90,2677.90, 200.00},
	{ "Verona Beach",647.70, -2173.20, -89.00, 930.20, -1804.20, 110.90},
	{ "Verona Beach",930.20, -2006.70, -89.00,1073.20, -1804.20, 110.90},
	{ "Verona Beach",851.40, -1804.20, -89.00,1046.10, -1577.50, 110.90},
	{ "Verona Beach", 1161.50, -1722.20, -89.00,1323.90, -1577.50, 110.90},
	{ "Verona Beach", 1046.10, -1722.20, -89.00,1161.50, -1577.50, 110.90},
	{ "HollyWood",787.40, -1310.20, -89.00, 952.60, -1130.80, 110.90},
	{ "HollyWood",787.40, -1130.80, -89.00, 952.60,-954.60, 110.90},
	{ "HollyWood",647.50, -1227.20, -89.00, 787.40, -1118.20, 110.90},
	{ "HollyWood",647.70, -1416.20, -89.00, 787.40, -1227.20, 110.90},
	{ "Whitewood Estates", 883.30,1726.20, -89.00,1098.30,2507.20, 110.90},
	{ "Whitewood Estates",1098.30,1726.20, -89.00,1197.30,2243.20, 110.90},
	{ "Willowfield",1970.60, -2179.20, -89.00,2089.00, -1852.80, 110.90},
	{ "Willowfield",2089.00, -2235.80, -89.00,2201.80, -1989.90, 110.90},
	{ "Willowfield",2089.00, -1989.90, -89.00,2324.00, -1852.80, 110.90},
	{ "Willowfield",2201.80, -2095.00, -89.00,2324.00, -1989.90, 110.90},
	{ "Willowfield",2541.70, -1941.40, -89.00,2703.50, -1852.80, 110.90},
	{ "Willowfield",2324.00, -2059.20, -89.00,2541.70, -1852.80, 110.90},
	{ "Willowfield",2541.70, -2059.20, -89.00,2703.50, -1941.40, 110.90},
	{ "Estacao Yellow Bell",1377.40,2600.40, -21.90,1492.40,2687.30,78.00},
	{ "Los Angeles", 44.60, -2892.90,-242.90,2997.00,-768.00, 900.00},
	{ "Las Vegas",869.40, 596.30,-242.90,2997.00,2993.80, 900.00},
	{ "Bone County",-480.50, 596.30,-242.90, 869.40,2993.80, 900.00},
	{ "Tierra Robada", -2997.40,1659.60,-242.90,-480.50,2993.80, 900.00},
	{ "Tierra Robada", -1213.90, 596.30,-242.90,-480.50,1659.60, 900.00},
	{ "San Francisco",-2997.40, -1115.50,-242.90, -1213.90,1659.60, 900.00},
	{ "Red County",-1213.90,-768.00,-242.90,2997.00, 596.30, 900.00},
	{ "Flint County",-1213.90, -2892.90,-242.90,44.60,-768.00, 900.00},
	{ "Whetstone", -2997.40, -2892.90,-242.90, -1213.90, -1115.50, 900.00}
};

//[BDR]RPG Rules Brasil™ Mensagens para o chat
new MSGs[17][256] = {
"[BDR]RPG Rules Brasil™ profissão? /profs",
"Proibido matar no hospital e/ou no banco!",
"Quer entrar pro Clan BDR? /bdr e boa sorte!!",
"Use /animlist e /animlist2 para ver as animações!",
"Entre no site da [BDR] www.bdr-clan.official.ws",
"Reporte um admin com: /rep [Texto]",
"Para saber os comandos de admin /admincomandos!!",
"Você já escolheu sua profissão? use: /rep [ID Prof] [Nome Prof]",
"Descapote seu carro: /descapotar ou /flip!!",
"NÃO SETEM CARROS SEM PERMISSÃO OU SERÁ PUNIDO!",
"Conheça os comandos digitando: /ajuda",
"/regras para saber as regras do [BDR]RPG Rules Brasil™",
"Criador do [BDR]RPG Rules Brasil™   ..::___ [BDR]Mac[BS] ___::..       ",
"Quer saber os preços de algumas coisas? /precos",
"Problemas para pular de um lugar alto? /paraquedas  resolve seus problemas",
"Para saber quais administradores online use: /admins",
"Você só pode falar com quem está longe de você usando /o"
};

//[BDR] RPG Rules Brasil™ segunda parte (cores) para mensagens do chat
new CORES[] = {
COR_BRANCO,
COR_LIMAO,
COR_VERDE,
COR_AMARELO
};

main()
{
	print("\n=============================================");
	print("#        .::[BDR]RPG Rules Brasil::.        #");
	print("#                                           #");
	print("#                    R                      #");
	print("#                    P                      #");
	print("#                    G                      #");
	print("#                                           #");
	print("#                    R                      #");
	print("#                    U                      #");
	print("#                    L                      #");
	print("#                    E                      #");
	print("#                    S                      #");
	print("#                                           #");
	print("#     .::Coder/Criador:[BDR]Mac[BS]::..     #");
	print("=============================================\n");

}

public OnGameModeInit()
{
    print("Carregando dados... [BDR]RPG Rules Brasil");
    SetGameModeText("[BDR]RPG Rules™");
    SetTimer("RandomMSGs",100000,1);
    SetTimer("RTi",500,true);
	EnableZoneNames(0);
    AllowAdminTeleport(1);
	worldTime = 8;
	SetNameTagDrawDistance(10.0);
	ShowNameTags(1);
	SetWeather(1);
    ShowPlayerMarkers(0);
	EnableTirePopping(1);
	AllowInteriorWeapons(1);
	UsePlayerPedAnims();
	EnableStuntBonusForAll(0);
	/*GlobalChatEnable(1)*/
	AddPlayerClass(72,-2153.4802,645.1187,52.3672,267.8673,0,0,0,0,0,0); //Inicio do Game Mode*/

	//ConnectNPC("npc1","casbi");
	//cascbi = AddStaticVehicleEx();
//=========================== [BDR]RPG Rules Brasil™ Carros ====================1117.7823,-2036.9849,78.7500
//----------------------------------------------------------------------------//
//================================== Los Santos ================================

    AddStaticVehicle(603,1735.4683,-1751.7422,13.3502,359.0199,69,1); //Phoenix
    AddStaticVehicle(489,1712.0985,-1727.2043,13.6040,89.0606,14,123); //Rancher
    AddStaticVehicle(451,1721.8984,-1727.2501,13.1724,91.4441,36,36); //Turismo
    AddStaticVehicle(411,1730.0380,-1727.1274,13.1940,89.5863,12,1); //Infernus
    AddStaticVehicle(515,1742.5697,-1759.9103,14.5772,0.5291,39,78); //RoadTrain
    AddStaticVehicle(584,1743.1643,-1773.5884,14.8024,0.5325,1,1); //Xoomer (Parte de caminhão à gás)
    AddStaticVehicle(437,1783.8998,-1691.1635,13.5834,89.3604,98,20); //Ônibus
    AddStaticVehicle(437,1783.9354,-1697.1990,13.6172,88.6400,6,6); //Ônibus
    AddStaticVehicle(437,1774.9193,-1701.4254,13.6334,88.3848,123,20); //Ônibus
    AddStaticVehicle(416,2010.9246,-1410.4421,17.1415,268.1629,1,3); //Ambulacia
    AddStaticVehicle(416,2035.3507,-1439.6804,17.4760,179.1478,1,3); //Ambulacia
    AddStaticVehicle(496,2157.8833,-1809.4391,13.0949,268.6738,6,0); //Blista Compact
    AddStaticVehicle(474,2158.2285,-1799.8569,13.1325,270.9170,81,1); //Hermes
    AddStaticVehicle(518,2157.5591,-1792.3596,13.0259,270.4482,9,39); //Fortune
    AddStaticVehicle(438,2188.2937,-1808.1447,13.3770,359.9593,6,76); //Cabbie
    AddStaticVehicle(438,2188.4937,-1799.6799,13.3769,0.6649,6,76); //Cabbie
    AddStaticVehicle(438,2188.4871,-1791.6948,13.3760,0.6740,6,76); //Cabbie
    AddStaticVehicle(431,2181.5632,-1776.7449,13.4507,0.9051,59,83); //Ônibus
    AddStaticVehicle(510,1782.1315,-1423.5140,15.3660,35.2948,6,6); //Mountain Bike
    AddStaticVehicle(510,1781.4355,-1423.9713,15.3241,35.2950,5,5); //Mountain Bike
    AddStaticVehicle(481,1780.9174,-1424.3904,15.2740,40.8761,46,46); //BMX
    AddStaticVehicle(544,1750.6758,-1455.5739,13.7830,269.1528,3,1); //Caminhão de Bombeiros
    AddStaticVehicle(500,1719.8713,-1386.1058,13.5587,180.7683,40,84); //Mesa
    AddStaticVehicle(424,1719.8285,-1370.8318,13.2417,182.2816,24,53); //BF-Injection
    AddStaticVehicle(471,1736.5380,-1387.8540,13.0672,44.5718,156,158); //QuadBike
    AddStaticVehicle(510,1782.7882,-1423.0012,15.3659,35.2947,16,16); //Mountain Bike
    AddStaticVehicle(529,1788.1937,-1623.6934,13.1524,267.9937,42,42); //Willard
    AddStaticVehicle(416,1179.8965,-1339.1077,13.9470,271.4211,1,3); //Ambulância
    AddStaticVehicle(541,1173.8776,-1310.0552,13.6161,268.6646,0,3); //Bullet
    AddStaticVehicle(402,1841.4713,-1871.1112,13.2214,0.8613,13,13); //Buffalo
    AddStaticVehicle(462,1718.8494,-1377.1079,12.9803,89.3468,3,1); //Lambreta
    AddStaticVehicle(462,1718.8285,-1375.6873,12.9811,90.4189,10,10); //Lambreta*/
    AddStaticVehicle(462,1718.8374,-1378.3804,12.9822,87.1501,12,12); //Lambreta
    AddStaticVehicle(462,1718.8088,-1379.5802,12.9751,82.4510,13,13); //Lambreta
    AddStaticVehicle(589,2438.3433,-2075.5618,14.7983,179.0052,31,31); //Club Auto-Escola
    AddStaticVehicle(475,2457.2776,-2077.4253,13.3512,179.8568,6,6); //Sabre Auto-Escola

//================================== San Fierro ================================

    AddStaticVehicle(424,-2461.4153,149.7205,34.8478,178.5786,155,155); //Bugzin no Hotel Garcia
    AddStaticVehicle(471,-2452.5964,155.5051,34.5167,358.8870,154,18); //Quadriciclo no Hotel Garcia
    AddStaticVehicle(571,-2495.6042,100.7505,34.4559,269.1019,36,2); //KART Hotel Garcia
    AddStaticVehicle(571,-2495.6924,98.3941,34.4557,270.2098,51,53); //KART Hotel Garcia
    AddStaticVehicle(571,-2495.5276,95.9665,34.4557,271.0012,91,2); //KART Hotel Garcia
    AddStaticVehicle(571,-2495.4851,93.7830,34.4560,271.7034,11,22); //KART Hotel Garcia
    AddStaticVehicle(571,-2499.0313,100.7802,34.4558,269.2032,40,35); //KART Hotel Garcia
    AddStaticVehicle(571,-2498.9668,98.4339,34.4560,269.1441,2,35); //KART Hotel Garcia
    AddStaticVehicle(571,-2498.9958,96.1103,34.4556,270.0529,36,2); //KART Hotel Garcia
    AddStaticVehicle(571,-2498.9949,93.8608,34.4557,271.4909,51,53); //KART Hotel Garcia
    AddStaticVehicle(568,-2510.6780,105.8574,22.1980,184.6706,9,39); //Bandito Hotel Garcia
    AddStaticVehicle(510,-2449.0747,148.7735,34.7337,90.6517,39,39); //Mountain Bike Hotel Garcia
    AddStaticVehicle(510,-2449.0706,147.9539,34.6998,90.6512,28,28); //Mountain Bike Hotel Garcia
    AddStaticVehicle(510,-2449.0679,147.1344,34.6988,90.6505,16,16); //Mountain Bike Hotel Garcia
    AddStaticVehicle(481,-2449.1465,149.6499,34.6434,88.0896,3,3); //BmX Hotel Garcia
    AddStaticVehicle(481,-2449.2300,150.6052,34.6397,90.0261,6,6); //BmX Hotel Garcia
    AddStaticVehicle(424,-2446.5313,131.8498,34.8381,270.0238,3,2); //BF Injecton Hotel Garcia
    AddStaticVehicle(462,-2460.8750,158.6973,34.5490,271.1028,13,13); //Lambreta (Faggio) Hotel Garcia
    AddStaticVehicle(462,-2460.7922,157.3427,34.5557,270.2443,14,14); //Lambreta (Faggio) Hotel Garcia
    AddStaticVehicle(462,-2460.6672,156.0751,34.5603,271.2405,1,2); //Lambreta (Faggio) Hotel Garcia
    AddStaticVehicle(462,-2460.9009,159.9690,34.5538,271.1864,2,1); //Lambreta (Faggio) Hotel Garcia
	AddStaticVehicle(487,2184.7444,-989.7562,72.5752,167.8220,54,29); //Helicoptero
    AddStaticVehicle(477,-1949.2726,258.5186,40.8065,56.0357,94,1); //ZR-350 Wang Cars
    AddStaticVehicle(506,-1955.4430,302.0269,35.1731,122.0902,6,6); //SuperGT Wang Cars
    AddStaticVehicle(597,-1588.2479,748.0393,-5.4903,359.9998,1,1); //Viatura Policial (SFPD)
	AddStaticVehicle(523,-1584.0217,749.4910,-5.6655,180.9966,6,0); //Viatura Policial (SFPD)
	AddStaticVehicle(523,-1579.8461,749.0732,-5.6571,181.8757,6,0); //Viatura Policial (SFPD)
	AddStaticVehicle(597,-1574.2565,742.4983,-5.5206,88.9996,6,1); //Viatura Policial (SFPD)
	AddStaticVehicle(523,-1573.5985,734.6492,-5.6689,90.0025,6,1); //Viatura Policial (SFPD)
	AddStaticVehicle(461,-2022.3977,-124.3720,34.7832,179.9717,3,3); //Moto escola
	AddStaticVehicle(487,-2032.2460,-155.6209,35.4656,0.0060,169,169); //Maverick escola
	AddStaticVehicle(487,-1829.1174,1300.2819,59.8817,204.0558,54,29); //Maverick
    AddStaticVehicle(575,-1379.9092,-246.2624,5.6041,1.1975,19,96); // Broadway LowRider Estacionamento do Aeroporto
    AddStaticVehicle(534,-1376.1696,-246.9119,5.7231,359.1782,42,42); // Remington LowRider Estacionamento do Aeroporto
	AddStaticVehicle(409,-1816.4678,1311.4034,50.2892,275.5558,1,1); //Limoto
	AddStaticVehicle(409,-1829.7208,1289.6337,50.2512,110.5457,1,1); //Limoto
	AddStaticVehicle(433,-1307.1633,456.9036,7.5909,89.9428,0,0); //Caminhão
	AddStaticVehicle(433,-1306.5189,463.9994,7.6436,89.6543,0,0); //Caminhão
	AddStaticVehicle(490,-1577.3809,672.4518,7.3176,130.5609,0,0); //Ranger do F.B.I
    AddStaticVehicle(490,-1576.2869,651.9721,7.3153,359.2167,0,0); //Ranger do F.B.I
    AddStaticVehicle(601,-1634.5223,651.0744,6.9463,1.2162,0,0); //Tanque da S.W.A.T
    AddStaticVehicle(601,-1628.3643,651.0035,6.9464,0.3379,0,0); //Tanque da S.W.A.T
    AddStaticVehicle(597,-1605.8036,673.6382,6.9079,179.0647,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(597,-1600.1277,673.6027,6.9104,178.9945,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(597,-1612.0612,673.4278,6.9086,180.2092,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(475,-2089.3955,-153.3617,35.1253,358.6243,6,6); // Sabre escola de pilotagem
    AddStaticVehicle(592,-1706.8824,-216.8194,15.3406,316.4026,1,1); //Andromada no Aeroporto
    AddStaticVehicle(519,-1352.6415,-387.5577,15.0710,264.5482,1,1); //Shamal no Aeroporto
	AddStaticVehicle(597,-1594.0265,673.7087,6.9101,179.2024,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(597,-1588.1838,673.4647,6.9087,179.4776,6,1); //Viatura policial (SFPD)
    AddStaticVehicle(416,-2543.9534,586.9307,14.6012,270.1252,1,1); //Ambulância no Hospital
    AddStaticVehicle(416,-2543.5486,592.9233,14.6027,269.7417,1,1); //Ambulância no Hospital
    AddStaticVehicle(416,-2543.3372,599.2736,14.6024,270.1265,1,1); //Ambulância no Hospital
    AddStaticVehicle(416,-2543.5833,604.8004,14.6023,269.4493,1,1); //Ambulância no Hospital
    AddStaticVehicle(416,-2618.9651,608.2448,14.6012,180.0322,1,1); //Ambulância no Hospital
    AddStaticVehicle(537,-1943.6602,149.6396,27.2245,357.9939,6,6); //Trem na estação de San Fierro
    AddStaticVehicle(544,-2020.7397,84.2854,28.1897,270.7138,3,3); //Caminhão do Corpo de Bombeiros
    AddStaticVehicle(407,-2022.7395,92.2502,28.3545,272.4844,3,3); //Caminhão do Corpo de Bombeiros
    AddStaticVehicle(475,-2092.1152,-146.2527,35.1277,0.6459,6,6); //Sabre na escola de pilotagem
    AddStaticVehicle(475,-2091.9978,-132.5226,35.1254,358.4965,6,6); //Sabre na Escola de pilotagem
    AddStaticVehicle(515,-1974.4406,104.9566,28.7055,88.8895,24,77); //Caminhão
    AddStaticVehicle(584,-1965.4539,97.5674,28.8349,90.5119,1,1); //Carga Xoomer

//==================== [BDR] RPG Rules Brasil™ salvados com tuning =============

    carrotuning1=AddStaticVehicle(533,-2500.6082,318.3912,29.2796,340.9762,156,156); //Feltzer, Hotel Queens
    AddVehicleComponent(carrotuning1, 1087);
    AddVehicleComponent(carrotuning1, 1080);
    AddVehicleComponent(carrotuning1, 1010);
    ChangeVehicleColor(carrotuning1, 156,156);

//========================== Create Objects de portões =========================
	direcao = CreateObject(980,2424.2488,-2089.8967,15.5469,0.0,0.0,270.0);

//=========================== Objetos Adicionais ===============================
//----------------------------------------------------------------------------//
//=============================== Auto-Escola ==================================

    CreateObject(985, 1582.625488, -1638.120361, 14.145326, 0.0000, 0.0000, 0.4821);
    CreateObject(987, 2424.333740, -2095.354980, 12.546875, 0.0000, 0.0000, 270.0000);
    CreateObject(987, 2424.870117, -2072.232666, 12.625959, 0.0000, 0.0000, 268.2811);
    CreateObject(1238, 2541.056641, -2113.563965, 12.857815, 0.0000, 0.0000, 0.0000);
    CreateObject(1257, 2420.214111, -2075.987305, 13.833027, 0.0000, 0.0000, 0.0000);
    CreateObject(1366, 2408.197998, -2075.744385, 13.167327, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2541.100586, -2119.936523, 12.857815, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2540.992676, -2115.330811, 12.857816, 0.0000, 0.0000, 0.0000);
    CreateObject(981, 2439.681152, -2096.740723, 13.498363, 0.0000, 0.0000, 180.0000);
    CreateObject(981, 2471.268799, -2096.691650, 13.498363, 0.0000, 0.0000, 180.0000);
    CreateObject(981, 2505.367188, -2096.929443, 13.498363, 0.0000, 0.0000, 180.0000);
    CreateObject(991, 2624.117920, -2114.527344, 13.762115, 0.0000, 0.0000, 90.0000);
    CreateObject(1238, 2624.890381, -2121.488525, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2629.380127, -2121.384766, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2626.432617, -2121.320313, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2631.083984, -2121.292725, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2627.783203, -2121.379150, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2626.118164, -2116.585938, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2627.875488, -2116.669922, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2629.301270, -2116.678711, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2632.850098, -2121.476807, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2624.518799, -2116.565186, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2633.005859, -2117.699463, 12.865055, 0.0000, 0.0000, 0.0000);
    CreateObject(1238, 2631.203369, -2117.155273, 12.865055, 0.0000, 0.0000, 0.0000);
//=============================== Pick Ups =====================================

    AddStaticPickup(1274,1,-1746.1521,962.3468,24.8906);//Cifrão Hotel SF $
	AddStaticPickup(1274,1,-1974.1283,117.5247,27.6875);//Cifrão Estação de Trem SF $
	AddStaticPickup(1274,1,-2446.8564,522.0898,30.2816);//Cifrão SA Federal Mint $
	AddStaticPickup(1274,1,1721.8188,-1718.9016,13.5341);//Cifrão perto do centro de Los Santos $
	AddStaticPickup(1274,1,398.1302,-1805.6890,7.8380);//Parque de diversões cifrão $
    AddStaticPickup(1274,1,1022.5526,-1122.4902,23.8712);//Teatro chinês cifrão $
 	Create3DTextLabel("Banco: San Fierro\n/banco",0x008080FF,-1746.1521,962.3468,24.8906,100.0,0);
    Create3DTextLabel("Banco: Los Santos\n/banco",0x008080FF,1721.8188,-1718.9016,13.5341,100.0,0);
    Create3DTextLabel("Banco: Los Santos\n/banco",0x008080FF,1022.5526,-1122.4902,23.8712,100.0,0);
    Create3DTextLabel("Banco: Los Santos\n/banco",0x008080FF,398.1302,-1805.6890,7.8380,100.0,0);
    
//Finalização de carros Pick Ups e Player Class=================================
	new File:temp;
	new index = 0;
	new tmp[256];
	new modelid, Float:X, Float:Y, Float:Z, Float:ang, Cor1, Cor2;
	temp = fopen("carrosbdr.rpg", io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		modelid    = strval(strtok(tmp, index));
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		ang        = Float:floatstr(strtok(tmp, index));
		Cor1       = strval(strtok(tmp, index));
		Cor2       = strval(strtok(tmp, index));

		cAddStaticVehicle(modelid, X, Y, Z, ang, Cor1, Cor2);
	}
	fclose(temp);

	SetTimer("Bancos", 500, 1);
	SetTimer("CheckFuel", 50000, 1);
	SetTimer("MoneyGrubScoreUpdate", 1000, 1);
	SetTimer("TempoPrisao", 1000, 1);
	SetTimer("Taxi", 5000, 1);
	SetTimer("ATaxi", 5000, 1);
	SetTimer("MTaxi", 5000, 1);
	SetTimer("Tempo", 60000, 1);
	SetTimer("Speed",1000,true);
	LoadPickups("pickups.rpg");
	return 1;
}

public update_zones() {
 new line1[10];
 new line2[10];
 for(new i=0; i<MAX_PLAYERS; i++) {
  if(IsPlayerConnected(i) && zoneupdates[i] == 1) {
   if(IsPlayerInZone(i,player_zone[i])) {  }
   else {
    new player_zone_before;
    player_zone_before = player_zone[i];
    player_zone[i] = -1;
    for(new j=0; j<sizeof(zones);j++) {
     if(IsPlayerInZone(i,j) && player_zone[i] == -1) {
      if(player_zone_before == -1) GameTextForPlayer(i,zones[j][zone_name],1100,1);
   	  else  if(strcmp(zones[j][zone_name],zones[player_zone_before][zone_name],true) != 0) GameTextForPlayer(i,zones[j][zone_name],1600,1);
      player_zone[i] = j;
      format(line1,10,"p%dzone",i);
      format(line2,10,"%d",j);
     }
    }
    if(player_zone[i] == -1) player_zone[i] = player_zone_before;
   }
  }
 }
}
IsPlayerInZone(playerid, zoneid) {
 if(zoneid == -1) return 0;
 new Float:x, Float:y, Float:z;
 GetPlayerPos(playerid,x,y,z);
 if(x >= zones[zoneid][zone_minx] && x < zones[zoneid][zone_maxx]
 && y >= zones[zoneid][zone_miny] && y < zones[zoneid][zone_maxy]
 && z >= zones[zoneid][zone_minz] && z < zones[zoneid][zone_maxz]
 && z < 900.0) return 1;
 return 0;
}
public OnPlayerRequestClass(playerid, classid)
{
	//PutPlayerInVehicle(playerid, cascbi, 1);
    SetPlayerColor(playerid,COR_NAO_LOGADO);
	SetPlayerPos(playerid,1117.7823,-2036.9849,78.7500);
	SetPlayerFacingAngle(playerid, 270.0);
	SetPlayerCameraPos(playerid,1122.3054,-2036.9288,80.3166);
	ApplyAnimation(playerid,"PED","WALK_DRUNK",4.1,1,1,1,1,1);
	SetPlayerCameraLookAt(playerid,1117.7823,-2036.9849,78.7500);
	PlayerPlaySound(playerid,SOM_MUSICA1,2050.1995, 1344.5500, 13.2378);

	if(PLAYERLIST_authed[playerid] == 1){
		PLAYERLIST_authed[playerid] = 0;
	}
	return 1;
}

public OnGameModeExit()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i)){
		    if (PLAYERLIST_authed[i] == 1) {

				udb_setAccState(PlayerName(i),GetPlayerMoney(i));
				new Float:health;
				GetPlayerHealth(i, health);
				udb_setHealth(PlayerName(i), health);
				udb_setGasoline(PlayerName(i), Petrol[i]);
				printf("Dados de %s (ID:%d) salvos com sucesso\n",PlayerName(i),i);
			}
		}
	}
	print("Desativando [BDR]RPG Rules");
	return 1;
}

public OnPlayerConnect(playerid)
{
    LoggedRcon[playerid] = 0;
	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
    new string[85],pname[24];
    GetPlayerName(playerid,pname,24);
    format(string,sizeof(string),"%s (ID: %d) Entrou no [BDR]RPG Rules Brasil™",pname,playerid);
    SendClientMessageToAll(COR_CINZA,string);
    SendClientMessage(playerid, COR_VERDE, "Obrigado por entrar no [BDR]RPG Rules Brasil™!");

    SetPlayerMapIcon(playerid, 1, -1741.7719,959.7177,24.8828, 52, 0);
    SetPlayerMapIcon(playerid, 2, -1606.4519,721.4300,12.1394, 30, 0);
    SetPlayerMapIcon(playerid, 3, -1672.8873,415.8133,7.1797, 55, 0);
    SetPlayerMapIcon(playerid, 4, -2655.6936,610.7681,14.4531, 22, 0);
    SetPlayerMapIcon(playerid, 5, -2441.1582,521.5623,29.9153, 52, 0);
    SetPlayerMapIcon(playerid, 6, -1974.4246,131.2647,27.6940, 52, 0);
    SetPlayerMapIcon(playerid, 7, -2019.9597,82.5911,27.9017, 20, 0);
    SetPlayerMapIcon(playerid, 8, -2024.2830,-106.2273,38.9219, 36, 0);
    SetPlayerMapIcon(playerid, 9, -1504.1316,-381.8920,6.6441, 5, 0);
    SetPlayerMapIcon(playerid, 10, -1447.1462,501.1122,3.0414, 9, 0);
    SetPlayerMapIcon(playerid, 11, -1421.0808,-290.1926,14.1484, 35, 0);
	SetPlayerMapIcon(playerid, 12, -1749.3800,865.1580,24.8828, 37, 0);
	SetPlayerMapIcon(playerid, 13, -2628.5759,1415.7240,24.5313, 23, 0);
	SetPlayerMapIcon(playerid, 14, 1721.6495,-1718.8131,13.5339, 52, 0);
    SetPlayerMapIcon(playerid, 15, -1970.7108,1273.3008,7.5242, 40, 0);
    SetPlayerMapIcon(playerid, 16, 1022.5909,-1122.4287,23.8713, 52, 0);
    SetPlayerMapIcon(playerid, 17, -2550.5078,192.8830,6.2136, 48, 0);
    SetPlayerMapIcon(playerid, 18, 1174.3204,-1323.7980,14.7891, 22, 0);
    SetPlayerMapIcon(playerid, 19, 2029.4742,-1405.1198,17.2420, 22, 0);
    SetPlayerMapIcon(playerid, 20, -1528.8109, 470.3552, 6.8553, 19, 1 ); //exercito
    SetPlayerMapIcon(playerid, 1, -1528.8109, 470.3552, 6.8553, 19, 1 ); //exercito
	SetPlayerMapIcon(playerid, 2, -1458.1555, 503.8067, 6.6632, 9, 1 ); //marinha
	SetPlayerMapIcon(playerid, 3, -346.2408, 1579.7504, 76.2719, 33, 1 );//drifters
	SetPlayerMapIcon(playerid, 4, -2642.2139, 1334.4849, 7.1837, 43, 1 ); //mafiayakuza
	SetPlayerMapIcon(playerid, 2, -2126.1174,-120.3214,38.5835, 46, 1 );//wangs
	SetPlayerMapIcon(playerid, 2, -2199.3616,638.6800,91.5240, 44, 1 );//mafia

	SetPlayerColor(playerid,COR_NAO_LOGADO);
	Profissao[playerid] = 0;
	Log[playerid] = 0;
	GameTextForPlayer(playerid, "~g~Bem v~r~in~w~do a~g~o ~n~R~y~P~b~G Ru~r~les ~g~Br~w~as~p~il", 5000, 4);
	SendClientMessage(playerid, COR_VERMELHO, "[BDR]Clan deseja um jogo limpo e justo!");
	SendClientMessage(playerid, COR_AMARELO, "Para ver os comandos do RPG digite: /ajuda");
	SendClientMessage(playerid, COR_AMARELO, "Se você é novo digite: /aprender");
	SendClientMessage(playerid, COR_AMARELO, "Se quiser emprego digite: /profs");
	if (udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COR_VERMELHO, "Você já está registrado. Logue-se digitando /logar [senha]");
	return 1;
}
    if (!udb_Exists(PlayerName(playerid))) {
	SendClientMessage(playerid, COR_VERMELHO, "Você não está registrado. Por Favor Registre-se digitando /registrar [senha]");
	return 1;
}

	PLAYERLIST_authed[playerid] = 0;
	AreaBanco[playerid] = 0;
	Log[playerid] = 0;
	return false;
}
forward IsNumeric(const string[]);

public IsNumeric(const string[])
{
	for (new i = 0, j = strlen(string); i < j; i++) if (string[i] > '9' || string[i] < '0') return 0;
	return 1;
}

public OnPlayerDisconnect(playerid,reason)
{
		zoneupdates[playerid] = 0;
	    player_zone[playerid] = -1;
        new string[85],pname[24];
        switch (reason)
{
case 0:
{
GetPlayerName(playerid,pname,24);
format(string,sizeof(string), "%s (ID: %d) Se desconectou do [BDR]RPG Rules (Bug ou Perda de Conexão)",pname,playerid);
SendClientMessageToAll(COR_CINZA, string);
}
case 1:
{
GetPlayerName(playerid,pname,24);
format(string,sizeof(string), "%s (ID: %d) Se desconectou do [BDR]RPG Rules (Saiu)",pname,playerid);
SendClientMessageToAll(COR_CINZA, string);
}
case 2:
{
GetPlayerName(playerid,pname,24);
format(string,sizeof(string), "%s (ID: %d) Se desconectou do [BDR]RPG Rules (Kikado/Banido)",pname,playerid);
SendClientMessageToAll(COR_CINZA, string);
}
}


        if (PLAYERLIST_authed[playerid] == 1) {

		udb_setAccState(PlayerName(playerid),GetPlayerMoney(playerid));
		new Float:health;
		Presos[playerid] = 0;
		Procurados[playerid] = 0;
		GetPlayerHealth(playerid, health);
		udb_setHealth(PlayerName(playerid), health);
		udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
		PLAYERLIST_authed[playerid] = 0;
		printf("Jogador %s (ID: %d) deixou o servidor. Seus dados foram salvos com sucesso",PlayerName(playerid),playerid);
	    }
		 else {
             printf("Jogador %s (ID: %d) deixou o servidor sem se registrar/logar",PlayerName(playerid),playerid);
             return 0;
        }
        return 1;
}

public OnPlayerSpawn(playerid)
{

/*if(IsPlayerNPC(playerid)) //Verifica se o jogador é um NPC.
{
new npcname[MAX_PLAYER_NAME];
GetPlayerName(playerid, npcname, sizeof(npcname)); //Obtendo o nome do(s) NPC(s).
if(!strcmp(npcname, "npc1", true)) //Checando se o nome do NPC é MeuPrimeiroNPC
{
PutPlayerInVehicle(playerid, cascbi, 0); //Colocar o NPC dentro do veículo que criamos para isso.
SetPlayerColor(playerid,COR_VENDEDOR);
SetPlayerSkin(playerid,285);
}
return 1;
}*/

  /*PutPlayerInVehicle(playerid, cascbi, 1);*/
    /*SetCameraBehindPlayer(playerid);*/
	zoneupdates[playerid] = 1;
	player_zone[playerid] = -1;
	if(!zoneupdate) zoneupdate = SetTimer("update_zones",1000,4);

//==============================================================================

    if(Profissao[playerid] == DESEMPREGADO) {
		SetPlayerColor(playerid, COR_DESEMPREGADO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2418.3506,1123.9360,10.8203);//Musica desligada
	}
	else if(Profissao[playerid] == TAXISTA) {
		SetPlayerColor(playerid, COR_TAXISTA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2418.3506,1123.9360,10.8203);//Musica desligada
		GivePlayerWeapon(playerid,5,0);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
		SetPlayerColor(playerid, COR_VENDEDOR);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2418.3506,1123.9360,10.8203);//Musica desligada
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == CORRETOR) {
		SetPlayerColor(playerid, COR_CORRETOR);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,15,0);
	}
    else if(Profissao[playerid] == GANG_RIFA) {
		SetPlayerColor(playerid, COR_GANG_RIFA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,4,0);
		GivePlayerWeapon(playerid,24,350);
		GivePlayerWeapon(playerid,30,400);
		GivePlayerWeapon(playerid,29,500);
	}
	else if(Profissao[playerid] == ASSASSINO) {
		SetPlayerColor(playerid, COR_ASSASSINO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,4,0);
		GivePlayerWeapon(playerid,24,350);
		GivePlayerWeapon(playerid,26,400);
		GivePlayerWeapon(playerid,18,5);
	}
    else if(Profissao[playerid] == BARMAN) {
		SetPlayerColor(playerid, COR_BARMAN);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == DETETIVE) {
		SetPlayerColor(playerid, COR_DETETIVE);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
    else if(Profissao[playerid] == KGB) {
		SetPlayerColor(playerid, COR_KGB);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == SWAT) {
		SetPlayerColor(playerid, COR_SWAT);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == FISCAL_DETRAN) {
		SetPlayerColor(playerid, COR_FISCAL_DETRAN);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == MOTORISTA_TREM) {
		SetPlayerColor(playerid, COR_MOTORISTA_TREM);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,2,0);
	}
	else if(Profissao[playerid] == VIDA_LOKA) {
		SetPlayerColor(playerid, COR_VL);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == FRENTISTA) {
		SetPlayerColor(playerid, COR_FRENTISTA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,2,0);
		GivePlayerWeapon(playerid,22,500);
	}
	else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
		SetPlayerColor(playerid, COR_VENDEDOR_DE_ARMAS);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,31,5000);
		GivePlayerWeapon(playerid,34,5000);
		GivePlayerWeapon(playerid,29,5000);
	}
	else if(Profissao[playerid] == JUIZ) {
		SetPlayerColor(playerid, COR_JUIZ);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,15,0);
		GivePlayerWeapon(playerid,22,300);
	}
    else if(Profissao[playerid] == MARINHA) {
		SetPlayerColor(playerid, COR_MARINHA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == CIA) {
		SetPlayerColor(playerid, COR_CIA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
    else if(Profissao[playerid] == FBI) {
		SetPlayerColor(playerid, COR_FBI);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == COMERCIO) {
		SetPlayerColor(playerid, COR_COMERCIO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,15,0);
		GivePlayerWeapon(playerid,22,300);
	}
	else if(Profissao[playerid] == RAPPER) {
		SetPlayerColor(playerid, COR_RAPPER);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,30,300);
		GivePlayerWeapon(playerid,29,300);
	}
    else if(Profissao[playerid] == BOXE) {
		SetPlayerColor(playerid, COR_BOXE);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        SetPlayerSkin(playerid,81);
	}
	else if(Profissao[playerid] == PADRE) {
		SetPlayerColor(playerid, COR_PADRE);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	}
    else if(Profissao[playerid] == ASSALTANTE) {
		SetPlayerColor(playerid, COR_ASSALTANTE);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,5,0);
	    GivePlayerWeapon(playerid,22,100);
	    GivePlayerWeapon(playerid,30,1000);
	}
	else if(Profissao[playerid] == SEGURANÇA) {
		SetPlayerColor(playerid, COR_SEGURANÇA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,24,400);
		GivePlayerWeapon(playerid,26,700);
	}
	else if(Profissao[playerid] == BOMBEIRO) {
		SetPlayerColor(playerid, COR_BOMBEIRO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,24,400);
		GivePlayerWeapon(playerid,26,700);
	}
	else if(Profissao[playerid] == MOTORISTA_PARTICULAR) {
		SetPlayerColor(playerid, COR_MOTORISTA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,41,900);
	}
	else if(Profissao[playerid] == COP_CIVIL) {
		SetPlayerColor(playerid, COR_COP_CIVIL);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,24,500);
		GivePlayerWeapon(playerid,25,100);
	}

	else if(Profissao[playerid] == COP_RODOVIARIO) {
		SetPlayerColor(playerid, COR_COP_RODOVIARIO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,3,0);
		GivePlayerWeapon(playerid,24,500);
		GivePlayerWeapon(playerid,25,100);
	}
	else if(Profissao[playerid] == COP_ELITE) {
		SetPlayerColor(playerid, COR_COP_ELITE);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,15);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == HOMEM_BOMBA) {
		SetPlayerColor(playerid, COR_HOMEM_BOMBA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,27,100);
		GivePlayerWeapon(playerid,29,1000);
	}
	else if(Profissao[playerid] == REI_DO_CRIME) {
		SetPlayerColor(playerid, COR_REI_DO_CRIME);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,16,1000);
		GivePlayerWeapon(playerid,31,1000);
		GivePlayerWeapon(playerid,27,1000);
		GivePlayerWeapon(playerid,29,1000);
		GivePlayerWeapon(playerid,12,1000);
	}
    else if(Profissao[playerid] == CACADOR) {
	    SetPlayerColor(playerid, COR_CACADOR);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,33,100);
	}
	else if(Profissao[playerid] == PESCADOR) {
		SetPlayerColor(playerid, COR_PESCADOR);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,14,0);
	}
	else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
		SetPlayerColor(playerid, COR_INSTRUTOR);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,14,0);
	}
	else if(Profissao[playerid] == TRAFICANTE) {
	    SetPlayerColor(playerid, COR_TRAFICANTE);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	}
	else if(Profissao[playerid] == MOTORISTA_DE_ONIBUS) {
		SetPlayerColor(playerid, COR_MOTORISTA_ONIBUS);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,42,400);
	}
	else if(Profissao[playerid] == NARCOTICOS) {
	    SetPlayerColor(playerid, COR_NARCOTICOS);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	}
	else if(Profissao[playerid] == CAMINHONEIRO) {
	    SetPlayerColor(playerid,COR_CAMINHONEIRO);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,23,355);
	}
	else if(Profissao[playerid] == JORNALISTA) {
	    SetPlayerColor(playerid,COR_JORNALISTA);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	}
	else if(Profissao[playerid] == IBAMA) {
	    SetPlayerColor(playerid,COR_IBAMA);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	    GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == POLICIA_FLORESTAL) {
	    SetPlayerColor(playerid,POLICIA_FLORESTAL);
        PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	    GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == COP_MILITAR) {
        SetPlayerColor(playerid,COR_COP_MILITAR);
        PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,30,100);
	    GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	    GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == PARAMEDICO) {
	    SetPlayerColor(playerid,COR_BRANCO);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,23,355);
	}
    else if(Profissao[playerid] == MATADOR_DE_ALGUEL) {
	    SetPlayerColor(playerid,COR_MATADOR_DE_ALUGUEL);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,31,99999);
	    GivePlayerWeapon(playerid,30,99999);
	    GivePlayerWeapon(playerid,26,99999);
	}
	else if(Profissao[playerid] == ADVOGADO) {
	    SetPlayerColor(playerid,COR_ADVOGADO);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == MOTOBOY) {
		SetPlayerColor(playerid, COR_MOTOBOY);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,5,600);
		GivePlayerWeapon(playerid,42,600);

	}
	else if(Profissao[playerid] == TAXISTA_AEREO) {
		SetPlayerColor(playerid, COR_TAXI_AEREO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == ENTREGADOR_PIZZA) {
		SetPlayerColor(playerid, COR_ENTREGADOR_PIZZA);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == SORVETEIRO) {
		SetPlayerColor(playerid, COR_SORVETEIRO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,500);
	}
	else if(Profissao[playerid] == HOT_DOG) {
		SetPlayerColor(playerid, COR_HOT_DOG);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,5,0);
		GivePlayerWeapon(playerid,24,500);
	}
    else if(Profissao[playerid] == PRESIDENTE) {
        SetPlayerColor(playerid, COR_PRESIDENTE);
        PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,35,99999 );
        GivePlayerWeapon(playerid,31,99999);
        GivePlayerWeapon(playerid,4,0);
        GivePlayerWeapon(playerid,16,99999);
    }
    else if(Profissao[playerid] == 	LADRAO_CARROS) {
        SetPlayerColor(playerid, COR_LADRAO_CARROS);
        PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,28,99999 );
        GivePlayerWeapon(playerid,30,99999);
        GivePlayerWeapon(playerid,4,0);
        GivePlayerWeapon(playerid,46,99999);
    	}
   	else if(Profissao[playerid] == 	PREFEITO) {
        SetPlayerColor(playerid, COR_PREFEITO);
        PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,28,99999 );
        GivePlayerWeapon(playerid,30,99999);
        GivePlayerWeapon(playerid,30,100);
        GivePlayerWeapon(playerid,46,99999);
        }
    else if(Profissao[playerid] == AGRICULTOR) {
		SetPlayerColor(playerid, COR_AGRICULTOR);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2418.3506,1123.9360,10.8203);//Musica desligada
		GivePlayerWeapon(playerid,2,0);
		}
    else if(Profissao[playerid] == GOVERNADOR) {
		SetPlayerColor(playerid, COR_COP_ELITE);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,35,99999 );
        GivePlayerWeapon(playerid,31,99999);
        GivePlayerWeapon(playerid,4,0);
        GivePlayerWeapon(playerid,16,99999);
    }
        else if(Profissao[playerid] == DEPUTADO) {
		SetPlayerColor(playerid, COR_DEPUTADO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,16,99999);
        }
		else if(Profissao[playerid] == CHERIFE) {
		SetPlayerColor(playerid, COR_CHERIFE);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		GivePlayerWeapon(playerid,10,500);
		GivePlayerWeapon(playerid,23,500);
		GivePlayerWeapon(playerid,30,500);
		}
		else if(Profissao[playerid] == TUNADOR) {
		SetPlayerColor(playerid, COR_TUNADOR);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,23,355);
	    GivePlayerWeapon(playerid,42,600);
	    GivePlayerWeapon(playerid,24,500);
        }
        else if(Profissao[playerid] == BDR) {
		SetPlayerColor(playerid, COR_BDR);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,28,99999);
	    GivePlayerWeapon(playerid,31,99999);
	    GivePlayerWeapon(playerid,34,99999);
	    GivePlayerWeapon(playerid,22,99999);
		GivePlayerWeapon(playerid,8,0);
        }
        else if(Profissao[playerid] == EXERCITO) {
		SetPlayerColor(playerid, COR_EXERCITO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,29,5000);
	    GivePlayerWeapon(playerid,30,5000);
	    GivePlayerWeapon(playerid,10,5000);
        }
        else if(Profissao[playerid] == FOTOGRAFO) {
		SetPlayerColor(playerid, COR_FOTOGRAFO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
	    GivePlayerWeapon(playerid,43,99999);
        }
		else if(Profissao[playerid] == COP_CORRUPTO) {
		SetPlayerColor(playerid, COR_COP_CORRUPTO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,29,5000);
	    GivePlayerWeapon(playerid,30,5000);
	    GivePlayerWeapon(playerid,10,5000);
        }
        else if(Profissao[playerid] == HOTELEIRO) {
		SetPlayerColor(playerid, COR_HOTELEIRO);
		PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
        GivePlayerWeapon(playerid,29,5000);
	    GivePlayerWeapon(playerid,30,5000);
	    GivePlayerWeapon(playerid,10,5000);
        }
		else{
	    SetPlayerColor(playerid, COR_DESEMPREGADO);
	    PlayerPlaySound(playerid,SOM_DESLIGADO,2050.1995, 1344.5500, 13.2378);//Musica desligada
		}

	PrecoCorrida[playerid] = 0;
}

public OnPlayerRequestSpawn(playerid)
{
	
	PlayerPlaySound(playerid, 1187, 0.0, 0.0, 0.0);
	SetCameraBehindPlayer(playerid);
	if(!PLAYERLIST_authed[playerid])
	SendClientMessage(playerid, COR_VERMELHO,"Desculpe, use: /registrar [sua senha] ou /logar [sua senha]");
    else LogarPlayer(playerid);
    return 0;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	zoneupdates[playerid] = 0;
	player_zone[playerid] = -1;
	new string[256];
	new morte = random(4);

	if(morte == 0){
	format(string,sizeof(string),"%s Morreu, VAMOS FESTEJAR!!",PlayerName(playerid));
	SendClientMessageToAll(COR_AZUL,string);
	}
	else if(morte == 1){
	format(string,sizeof(string),"%s Morreu, alguém tem que explicar que Homem-de-Ferro é só história -.-'",PlayerName(playerid));
	SendClientMessageToAll(COR_VERMELHO,string);
	}
	else if(morte == 2){
	format(string,sizeof(string),"%s Morreu, vamos ao enterro dele fazer um ritual para que continue morto!!",PlayerName(playerid));
	SendClientMessageToAll(COR_AMARELO,string);
	}
	else if(morte == 3){
	format(string,sizeof(string),"%s Morreu, virou defunto, nunca mais iremos ter alguem como ele =,(",PlayerName(playerid));
	SendClientMessageToAll(COR_BRANCO,string);
	}

	if(GetClosestHospital(playerid) == 0){
    	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), -2651.6501, 634.4510, 14.4531, 180.0000, 0, 0, 0, 0, 0, 0);
    }
    else if(GetClosestHospital(playerid) == 1){
    	SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1173.5842,-1324.5615,15.1953,278.4624,0,0,0,0,0,0);
    }
    else if(GetClosestHospital(playerid) == 2){
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),2031.9415,-1404.3578,17.2614,165.8180,0,0,0,0,0,0);
    }
    else if(GetClosestHospital(playerid) == 3){
        SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),1582.5615,1768.7921,10.8203,93.7454,0,0,0,0,0,0);
    }
    GameTextForPlayer(playerid,"~r~Morto",4000,2);

	if(Procurados[playerid] == 1){
	    Procurados[playerid] = 0;
	    Presos[playerid] = 1;
		udb_setPrisao(PlayerName(playerid), 1);
		LogarPlayer(playerid);
	}
	if(killerid == INVALID_PLAYER_ID) {
        SendDeathMessage(INVALID_PLAYER_ID,playerid,reason);
        SendClientMessage(playerid, COR_BRANCO, " ");
        SendClientMessage(playerid,COR_AZULPLUS,"Médico: Você agora está bem, mas a consulta foi cobrada na quantia de R$150!");
		GivePlayerMoney(playerid, -150);
        GameTextForPlayer(playerid,"~r~Morto",4000,2);
	}
	else{
		SendDeathMessage(killerid,playerid,reason);
		new anivel;
 	    new bnivel;
  	    anivel = GetPlayerWantedLevel(killerid);
   	    bnivel = anivel +1;
		if (GetPlayerMoney(playerid) > 0)  {
			SendClientMessage(playerid, COR_VERMELHO2, string);
			format(string, sizeof(string), "Hospital: %s matou você! Nós achamos você caido você foi trazido até aqui mas não encotramos seu dinheiro!", PlayerName(killerid));
			SendClientMessage(playerid, COR_VERMELHO2, string);
            GameTextForPlayer(playerid,"~r~Morto",4000,2);
            SetPlayerWantedLevel(killerid, bnivel);
            SetPlayerWantedLevel(playerid, 0);
			SendClientMessage(killerid, COR_VERMELHO2, "Seu nível de procurado foi aumentado por cometer um assasinato!!");
			GivePlayerMoney(killerid, GetPlayerMoney(playerid));
			ResetPlayerMoney(playerid);
		}
 	}
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
if ((carrotuning1))
{
SetTimerEx("remodcar",3000,0,"%d",vehicleid);
}
return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
}
public OnPlayerCommandText(playerid, cmdtext[])
{
	new playermoney;
	new cmd[256];
	new giveplayerid, moneys, idx;
    new giveplayer[MAX_PLAYER_NAME];
    new sendername[MAX_PLAYER_NAME];

    cmd = strtok(cmdtext, idx);
	if(strcmp(cmd, "/piracemaon",true) == 0) {
	    if(Profissao[playerid] == IBAMA || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COR_VERMELHO,"Já é época de piracema!");
	            return 1;
	        } else {
	            SendClientMessageToAll(COR_VERMELHO,"Época de piracema, quem for pego pescando será preso.");
	            SendClientMessage(playerid,COR_VERDE,"Feito.");
	            Piracema = 1;
	            return 1;
	        }
	    } else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
	    }
	}
	if(strcmp(cmd, "/destruirveiculo",true)==0 && IsPlayerInAnyVehicle(playerid)){
       if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
	    DestroyVehicle(GetPlayerVehicleID(playerid));
	    SendClientMessage(playerid, COR_VERDE,"Ok, destruido!");
	    return 1;}}
	    
    if(strcmp(cmd,"/roubar",true)==0){
	    if(Profissao[playerid] == REI_DO_CRIME || Profissao[playerid] == BDR || Profissao[playerid] == ASSALTANTE || Profissao[playerid] == GANG_RIFA || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
            new distancia;
	    	distancia = GetDistanceBetweenPlayers(playerid,plid);
			tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
	        	SendClientMessage(playerid,COR_VERMELHO,"/roubar [ID]");
				return 1;
			}
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			if(distancia > 20){
			SendClientMessage(playerid,COR_VERMELHO,"Por favor chegue mais perto de alguem para roubar.");
            return 1;
			}
				else {
				    SendClientMessage((playerid),COR_VERDE,"Legal acabou de roubar alguem.");
				    SendClientMessage((playerid),COR_AZUL, "O dinheiro roubado foi R$1500, o dinheiro está na sua conta bancária");
				    SendClientMessage((plid),COR_VERMELHO,"Sua Conta foi roubada.");
					udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + 1500);
				    udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - 1500);
					return 1;
				}
			}
		    else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado");
				return 1;
			}
		}
	}
    if(strcmp(cmd, "/godmode", true) == 0){
        if(IsPlayerAdmin(playerid)){
	       SetPlayerHealth(playerid, 9999999999);
	       SendClientMessage(playerid, COR_VERDE, "Você está em modo Deus");
	       return 1;
	   }
	}

    if(strcmp(cmd, "/godmodeoff", true) == 0){
        if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
	       SetPlayerHealth(playerid, 100);
	       SendClientMessage(playerid, COR_VERDE, "Você não está mais em modo Deus");
	       return 1;
	   }
	}
	if (strcmp(cmd, "/colete", true) == 0){
         if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
	        SetPlayerArmour(playerid, 100);
            SendClientMessage(playerid, COR_VERDE, "[BDR]RPG Rules Brasil™ completando seu colete xD");
            return 1;
        }
    }
//==================================Comandos para portões=======================

    if (strcmp(cmdtext,"/aep", true)==0){
         if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
        MoveObject(direcao,2424.3005,-2108.6191,15.2790,3);
        SendClientMessage(playerid,0x0000FFAA, "Auto-Escola Aberta!");
        return 1;
    		}}
    if (strcmp(cmdtext,"/fep", true)==0){
         if(Profissao[playerid] == BDR || Profissao[playerid] == INSTRUTOR_DE_DIRECAO || IsPlayerAdmin(playerid)){
	    MoveObject(direcao,2424.2488,-2089.8967,15.5469,3);
	    SendClientMessage(playerid,0x0000FFAA, "Auto-Escola Fechada!");
        return 1;
    		}}

//=================================Fim dos portões==============================

	if(strcmp(cmd, "/pintar", true) == 0) {
        if(Profissao[playerid] == TUNADOR || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
        new tmp[256];
        new cor1,cor2;
        new veiculo;
        tmp = strtok(cmdtext,idx);
        cor1 = strval(tmp);
        tmp = strtok(cmdtext, idx);
        if(!strlen(tmp)) {
    SendClientMessage(playerid, COR_VERMELHO, "/pintar [Cor1] [Cor2]");
    return 1;
}

        cor2 = strval(tmp);
        veiculo = GetPlayerVehicleID(playerid);
        if(IsPlayerInVehicle(playerid,veiculo)){
        ChangeVehicleColor(veiculo,cor1,cor2);
        SendClientMessage(playerid,COR_MECANICO,"Veiculo Pintado com sucesso.");
        return 1;
}
}
}

    if(strcmp(cmd, "/assaltarbanco", true) == 0) {
	    if(Profissao[playerid] == ASSALTANTE || IsPlayerAdmin(playerid)){
        	if(AreaBanco[playerid] == 1){
				if(TempoAssalto[playerid] == 0){
        		    GivePlayerMoney(playerid, 1000);
					SendClientMessage(playerid, COR_ASSALTANTE, "Roubo feito!");
     				TempoAssalto[playerid]++;
 					SetTimerEx("Assalto",600000,false,"%d",playerid);
					return 1;
				} else {
					SendClientMessage(playerid, COR_VERMELHO,"Você já assaltou espere a poeira baixar para assaltar novamente!");
					return 1;
				}
			} else {
			    SendClientMessage(playerid, COR_VERMELHO,"Você não está na área de um banco!");
			    return 1;
			}
		} else {
	    	SendClientMessage(playerid, COR_VERMELHO2, "Você não é assaltante!");
			return 1;
		}
	}

    if(strcmp(cmdtext, "/jetpack", true) == 0)
    {
	   if (IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
       if(!IsPlayerInAnyVehicle(playerid)) {
       SetPlayerSpecialAction(playerid, 2);
       } else {
       SendClientMessage(playerid, COR_VERMELHO, "Você não pode usar um jetpack dentro de um veículo!");
    }
       return 1;
    }
  }

    if(strcmp(cmd,"/plantarbomba",true) == 0){
       new dinid,Float:x,Float:y,Float:z;
	   if (IsPlayerAdmin(playerid) || Profissao[playerid] == HOMEM_BOMBA || Profissao[playerid] == BDR){
       if(IsPlayerInAnyVehicle(playerid)){
           SendClientMessage(playerid,COR_VERMELHO,"Não é possível plantar uma bomba dentro de um veículo!");
           return 1;
         }
       GetPlayerPos(playerid,x,y,z);
       ApplyAnimation(playerid, "BOMBER", "BOM_Plant", 4.0, 0, 0, 0, 0, 0);
       SetTimerEx("CriarExplosao",8000,false,"fffdf",x,y,z,2,200.0);
       dinid = CreateObject(1252,x,y,z-0.8,0,0,0);
       SetTimerEx("DestruirObjeto",8000,false,"d",dinid);
       SendClientMessage(playerid,COR_AMARELO,"A Bomba foi Plantada!VAI EXPLODIR! COREEE!");
       return 1;}}
       
    if (strcmp(cmd, "/gangue", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/gangue [Comando para a gangue]");
	    	return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERDE, "A Gangue foi informada");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == GANG_RIFA){
					format(string, sizeof(string), "%s Falou: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_COP_CIVIL, string);
		        }
			}
		}
	}
	if(strcmp(cmd, "/setskin", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS ||Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid, skin;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/setskin [id] [id da skin]");
				return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setskin [id] [id da skin]");
				return 1;
			}
			skin = strval(tmp);
			if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==273 || skin==274 || skin==289 || skin>=300 || skin>=51313531){
				SendClientMessage(playerid, COR_VERMELHO, "Skin ID Inválido!");
				return 1;
			}
			if(IsPlayerConnected(plid)){
			    udb_setSkin(PlayerName(plid), skin);
				SendClientMessage(playerid, COR_VERDE, "A skin foi setada com sucesso!");
				SendClientMessage(plid, COR_VERDE, "O administrador deu a você uma nova skin");
				SetPlayerPos(plid, -1958.5107, 293.6747, 35.4688);
				LogarPlayer(plid);
				return 1;
			}
            else{
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
				return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}

	if(strcmp(cmd,"/temporadacacaoff",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        if(Piracema == 1){
	            SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça já está desativada!");
	            return 1;
	        } else {
	            SendClientMessageToAll(COR_VERMELHO,"Temporada de caça desativada, quem for pego caçando será preso.");
	            SendClientMessage(playerid,COR_BRANCO,"Feito.");
	            TemporadaCaca = 0;
	            return 1;
	        }
	    } else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
	    }
	}

	if(strcmp(cmd, "/flip",true) == 0)
{
    new Float:X, Float:Y, Float:Z;
    if(IsPlayerInAnyVehicle(playerid))

    SetCameraBehindPlayer(playerid);
    GetPlayerPos(playerid, X, Y, Z);
    SetVehiclePos(GetPlayerVehicleID(playerid), X, Y, Z);
    SetVehicleZAngle(GetPlayerVehicleID(playerid), 0);
    return 1;
}
    if(strcmp(cmd,"/piracemaoff",true) == 0) {
	    if(Profissao[playerid] == IBAMA || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COR_VERMELHO,"A piracema não está ativada!");
			    return 1;
			} else {
			    SendClientMessageToAll(COR_VERDE,"Piracema Desativada... Pode Pescar Avontade");
			    SendClientMessage(playerid,COR_BRANCO,"Feito.");
			    Piracema = 0;
			    return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
		    return 1;
		}
	}
	if(strcmp(cmd,"/temporadacacaon",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL ||  Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        if(Piracema == 0){
	            SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça já está ativada!");
		    	return 1;
			} else {
			    SendClientMessageToAll(COR_VERDE,"Temporada de caça ativada. Pode caçar à vontade!");
			    SendClientMessage(playerid,COR_BRANCO,"Feito.");
			    TemporadaCaca = 1;
		    	return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/plantarmilho", true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	        if(AreaFazenda[playerid] == 0){
	            SendClientMessage(playerid, COR_VERMELHO, "Você não está na área da fazenda, peça par ao adm mostrar a localização.");
				return 1;
			} else {
			    if(FazendaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COR_VERMELHO, "A colheita ainda não está pronta espera mais um pouco.");
					return 1;
				} else {
					SendClientMessage(playerid, COR_AGRICULTOR, "Agricultor, o plantiu acabou.");
                    SendClientMessage(playerid, COR_VERDE, "Agora espere terminar de crescer {6 horas}");
			    	FazendaInProgress[playerid] = 1;
			    	SetTimer("Fazenda",360000,false);
					return 1;
				}
            }
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
			return 1;
		}

	}
	if(strcmp(cmd,"/vendermilho",true) == 0) {
	    if(Profissao[playerid] == AGRICULTOR || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
		    if(AreaCoopFazenda[playerid] == 0){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não está na Fazenda.");
	            return 1;
			} else {
			    if(QtMilho[playerid] == 0){
			        SendClientMessage(playerid, COR_VERMELHO, "Você não plantou milho, use /plantarmilho para isto.");
					return 1;
     			} else {
					new msg[256];
					new quantia;
					quantia = QtMilho[playerid]*400;
					format(msg, sizeof(msg),"Você vendeu %d saco de milho por $400 cada um e faturou R$%d com a venda.",QtMilho[playerid],quantia);
					SendClientMessage(playerid,COR_AGRICULTOR,msg);
					GivePlayerMoney(playerid,quantia);
					QtMilho[playerid] = 0;
					return 1;
   			    }

			}

		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para o uso deste comando!");
			return 1;
  }
 
	}
	if(strcmp(cmd,"/prenderpesca",true) == 0) {
	    if(Profissao[playerid] == IBAMA ||  Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COR_VERMELHO,"/prenderpesca [ID]");
		    	return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(Piracema == 0){
			        SendClientMessage(playerid,COR_VERMELHO,"A piracema não está ativada para você efetuar a prisão!");
			    	return 1;
				} else {
				    if(PescaInProgress[plid] == 0){
				        SendClientMessage(playerid,COR_VERMELHO,"O jogador não está pescando!");
				    	return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
					        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para efetuar a prisão!");
					    	return 1;
						} else {
						    udb_setPrisao(PlayerName(plid),1);
						    LogarPlayer(plid);
					    	return 1;
						}
					}
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso");
	    	return 1;
		}
	}
	if (strcmp("/godcoff", cmdtext, true, 10) == 0){
         if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR) {
	        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehicleHealth(GetPlayerVehicleID(playerid),1000);
            SendClientMessage(playerid, COR_VERDE, "Seu carro não está mais em modo deus");
}
            else {
            SendClientMessage(playerid,COR_VERMELHO,"Você não está em um veiculo!");
}
            return 1;
         }
	  }
    if (strcmp("/godc", cmdtext, true, 10) == 0){
         if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR) {
	        if (IsPlayerInAnyVehicle(playerid)) {
            SetVehicleHealth(GetPlayerVehicleID(playerid),999999);
            SendClientMessage(playerid, COR_VERDE, "Seu carro está em modo deus");
}
            else {
            SendClientMessage(playerid,COR_VERMELHO,"Você não está em um veiculo!");
}
            return 1;
         }
	  }
    if(strcmp(cmd,"/prendercaca",true) == 0) {
	    if(Profissao[playerid] == POLICIA_FLORESTAL ||  Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext,idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid,COR_VERMELHO,"/prenderpesca [id]");
		    	return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(TemporadaCaca == 1){
			        SendClientMessage(playerid,COR_VERMELHO,"A temporada de caça está ativada, por isso você não pode prendê-lo!");
			    	return 1;
				} else {
				    if(CacaInProgress[plid] == 0){
				        SendClientMessage(playerid,COR_VERMELHO,"O jogador não está caçando!");
				    	return 1;
					} else {
					    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
					        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para efetuar a prisão!");
					    	return 1;
						} else {
						    udb_setPrisao(PlayerName(plid),1);
						    LogarPlayer(plid);
					    	return 1;
						}
					}
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/telepizza", true)==0){
	    SendClientMessage(playerid,COR_AMARELO,"Uma pizza está a caminho!");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Profissao[i] == ENTREGADOR_PIZZA || IsPlayerAdmin(i) || Profissao[i] == BDR){
	            new msg[256];
	            format(msg,sizeof(msg),"O jogador %s solicita uma pizza.",PlayerName(playerid));
	            SendClientMessage(i,COR_ENTREGADOR_PIZZA,msg);
		     	return 1;
			}
	    	return 1;
		}
    	return 1;
	}
    if (strcmp("/beijar", cmdtext, true) == 0) {
          ApplyAnimation(playerid, "KISSING", "Playa_Kiss_02", 3.0, 0, 0, 0, 0, 0);
		  return 1;
	}

    if(strcmp(cmdtext, "/admins", true) == 0){
  new Administrador[24];
  new count = 0;
  new send[256];
  SendClientMessage(playerid, COR_VERDE, "Administradores Online:");
  for(new i=0; i<MAX_PLAYERS; i++){
  if(IsPlayerConnected(i) && IsPlayerAdmin(i)){
  GetPlayerName(i,Administrador,24);
  format(send,sizeof(send),"%s", Administrador);
  SendClientMessage(playerid, COR_BDR, send);
  count++;
  }
  }
  if(count == 0){
  SendClientMessage(playerid, COR_VERMELHO, "Sinto muito, mas no momento não tem nenhum administrador disponível");
  }
  return 1;
  }
    if(strcmp(cmd, "/entregarpizza", true) == 0) {
	    if(Profissao[playerid] == ENTREGADOR_PIZZA || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/entregarpizza [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			    	SendClientMessage(playerid,COR_ENTREGADOR_PIZZA,"Pizza entregue.");
				    SendClientMessage(plid,COR_ENTREGADOR_PIZZA,"Você se deliciou com a Pizza original [BDR]RPG Rules Brasil™");
				    GivePlayerMoney(playerid,10);
				    GivePlayerMoney(plid,-10);
				    SetPlayerHealth(plid,100);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para entregar a pizza!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas entregadores de pizza podem fazer isto!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/advogado", true)==0){
 		SendClientMessage(playerid, COR_ADVOGADO, "Um dos advogados de San Fierro, ira lhe defender no tribunal de San Andreas! =/.");
   		for(new i=0; i<MAX_PLAYERS; i++){
     		if(IsPlayerConnected(i) && Profissao[i] == ADVOGADO || IsPlayerAdmin(i)){
     		    new string[256];
				format(string, sizeof(string), "O jogador %s solicita um advogado.", PlayerName(playerid));
				SendClientMessage(i, COR_ADVOGADO, string);
				return 1;
			}
		}
	}

	if (strcmp(cmd, "/processo", true)==0){
		if(Profissao[playerid] == ADVOGADO ||Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
			new string[256];
	    	strmid(tmp, cmdtext, 10, strlen(cmdtext));
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/processo [ nome do réu e descrição da causa ]");
		    	return 1;
			}
		    SendClientMessage(playerid, COR_ADVOGADO, "Voce fez a defesa do seu cliente e o processo está em andamento, aguarde a sentença do juiz");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == JUIZ || IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
					format(string, sizeof(string), "O Dr.%s entrou com um petição em defesa do réu %s.", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_JUIZ, string);
			    	return 1;
		        }
			}
		} else {
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
		    return 1;
		}
	}
	if(strcmp(cmd, "/render", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
  	  		return 1;
		}
	}
	if(strcmp(cmd, "/handsup", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
  	  		return 1;
		}
	}
	if(strcmp(cmd, "/renderse", true) == 0) {
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT) {
		    SetPlayerSpecialAction(playerid,SPECIAL_ACTION_HANDSUP);
  	  		return 1;
		}
	}
	if(strcmp(cmd,"/verpesca",true) == 0) {
	    if(Profissao[playerid] == IBAMA || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/verpesca [id]");
		    	return 1;
			}
			plid = strlen(tmp);
   			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
   			    if(PescaInProgress[plid] == 0){
   			        SendClientMessage(playerid,COR_VERDE,"O jogador não está pescando");
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERDE,"O jogador está pescando");
			    	return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}

	if(strcmp(cmd,"/vercaca",true) == 0) {
	    if(Profissao[playerid] == IBAMA || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext,idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid,COR_VERMELHO,"/verpesca [ID]");
		    	return 1;
			}
			plid = strlen(tmp);
   			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
   			    if(CacaInProgress[plid] == 0){
   			        SendClientMessage(playerid,COR_VERDE,"O jogador não está caçando.");
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERDE,"O jogador está caçando.");
			    	return 1;
				}
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
		    	return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vendepesca", true) == 0) {
	    new msg[256];
	    new quantia;
	    if(AreaCoopPesca[playerid] == 1){
	    	if(QtPescas[playerid] == 0){
	        	SendClientMessage(playerid, COR_VERMELHO, "Você não tem nenhuma pesca, como poderá vender?");
	        	return 1;
			} else {
		    	if(Profissao[playerid] == PESCADOR) {
		   			quantia = QtPescas[playerid]*130;
		   			GivePlayerMoney(playerid,quantia);
					format(msg,sizeof(msg),"Você vendeu %d pesca(s) por $130 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COR_VERDE, msg);
					QtPescas[playerid] = 0;
					return 1;
				}
				else {
				    quantia = QtPescas[playerid]*100;
				    GivePlayerMoney(playerid,quantia);
				    format(msg,sizeof(msg),"Você vendeu %d pesca(s) por $100 cada e faturou $%d com a venda.",QtPescas[playerid],quantia);
					SendClientMessage(playerid, COR_VERDE, msg);
					QtPescas[playerid] = 0;
					return 1;
				}
			}
		}
		else {
			SendClientMessage(playerid, COR_VERMELHO, "Você não está na Cooperativa de Pesca.");
			return 1;
		}
	}
	if(strcmp(cmd,"/vendecaca",true) == 0) {
	    if(Profissao[playerid] == CACADOR || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
		    if(AreaCoopCaca[playerid] == 0){
		        SendClientMessage(playerid, COR_VERMELHO, "Você não está na Cooperativa de Caça.");
		    	return 1;
			} else {
			    if(QtCacas[playerid] == 0){
			        SendClientMessage(playerid, COR_VERMELHO, "Você não tem caças acumuladas.");
			    	return 1;
				} else {
					new msg[256];
					new quantia;
					quantia = QtCacas[playerid]*100;
					format(msg, sizeof(msg),"Você vendeu %d caça(s) por $100 cada e faturou $%d com a venda.",QtCacas[playerid],quantia);
					SendClientMessage(playerid,COR_VERDE,msg);
					GivePlayerMoney(playerid,quantia);
					QtCacas[playerid] = 0;
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd,"/descarregar",true) == 0){
	    if(Profissao[playerid] == CAMINHONEIRO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	        if(AreaDescarga[playerid] == 1){
	            if(Carregamento[playerid] == 0){
	                SendClientMessage(playerid,COR_VERMELHO,"Seu veículo não está carregado!");
			    	return 1;
				} else {
				    Carregamento[playerid] = 0;
				    SendClientMessage(playerid,COR_VERDE,"Seu veículo foi descarregado.");
				    GivePlayerMoney(playerid,100);
				    return 1;
				}
			} else {
				SendClientMessage(playerid,COR_VERMELHO,"Você não está na área de carga");
			    return 1;
			}
		}
	}
	if(strcmp(cmd, "/carregar", true) == 0) {
	    if(Profissao[playerid] == CAMINHONEIRO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	        if(AreaCarga[playerid] == 1){
				new modelo;
				cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
				if(modelo == VEH_RDTRAIN){
				    if(Carregamento[playerid] == 0){
				    	SendClientMessage(playerid,COR_VERDE,"Veículo carregado!");
				    	SendClientMessage(playerid,COR_VERDE,"Para descarregá-lo, vá a área de descarga, RS Haul (perto de um posto)");
				    	Carregamento[playerid] = 1;
					    return 1;
					} else {
				        SendClientMessage(playerid,COR_VERMELHO,"Seu caminhão já está carregado!");
				    	return 1;
					}
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Você não está em um caminhão ROADTRAIN!");
			    	return 1;
				}
	        } else {
	            SendClientMessage(playerid, COR_VERMELHO, "Você não está na área de carga!");
		    	return 1;
			}
	    }
	    else{
	        SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	        return 1;
	    }
	}
	if(strcmp(cmd, "/vheroina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == BDR || Profissao[playerid] == COP_CORRUPTO ||Profissao [playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vheroina [ID] [quantidade]");
		     	return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vheroina [ID] [quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Você está louco? Quer matar o seu cliente? Doses de 1 a 7");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Te peguei, bichinho! Querendo enganar o freguês, não? Doses de 1 à 7");
			    return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			        return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chegue mais perto para aplicar a injeção.");
				    	return 1;
				 	} else {
			        	if(Heroina[plid] == 7){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
					    	return 1;
						} else {
					    	Heroina[plid] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Você está agora com %d doses de heroína no sangue",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
					    	return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	if(strcmp(cmd, "/vcrack", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == BDR || Profissao[playerid] == COP_CORRUPTO ||Profissao[playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vcrack [ID] [Quantidade]");
			    return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vcrack [ID] [Quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 8){
			    SendClientMessage(playerid, COR_VERMELHO, "Você deve estar querendo que seu freguês acabe pelado em cima de uma casa? doses de 0 à 7 somente.");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não pode dar ao seu cliente 0 doses, 0 à 7 doses.");
		    	return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			        return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chege mais perto para vender o bagulho.");
					    return 1;
					} else {
			        	if(Maconha[plid] == 10){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
					    	return 1;
						} else {
					    	Maconha[plid] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Está concentrada em seu pulmão %d doses de crack.",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
					    	return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	if(strcmp(cmd, "/vmaconha", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == BDR || Profissao[playerid] == COP_CORRUPTO ||Profissao[playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vmaconha [id] [quantidade]");
			    return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vmaconha [id] [quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 500){
			    SendClientMessage(playerid, COR_VERMELHO, "Você está louco? Quer matar o seu cliente? Doses de 1 a 10");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Te peguei, bichinho! Querendo enganar o freguês, não? Doses de 1 à 7");
		    	return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			        return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chege mais perto para vender o bagulho.");
					    return 1;
					} else {
			        	if(Maconha[plid] == 10){
			        	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
					    	return 1;
						} else {
					    	Maconha[plid] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Está concentrada em seu pulmão %d doses de maconha.",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
					    	return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	if(strcmp(cmd, "/vcocaina", true) == 0) {
	    if(Profissao[playerid] == TRAFICANTE || Profissao[playerid] == BDR || Profissao[playerid] == COP_CORRUPTO ||Profissao[playerid] == REI_DO_CRIME || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new msg[256];
	        new plid, mili;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO,"/vcocaina [id] [quantidade]");
		    	return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
			    SendClientMessage(playerid, COR_VERMELHO, "/vcocaina [id] [quantidade]");
		    	return 1;
			}
			mili = strval(tmp);
			if(mili > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Você está louco? Quer matar o seu cliente? Doses de 1 a 7");
		    	return 1;
			}
			else if(mili < 1){
			    SendClientMessage(playerid, COR_VERMELHO, "Te peguei, bichinho! Querendo enganar o freguês, não? Doses de 1 à 7");
		    	return 1;
			}else{
			    if(!IsPlayerConnected(plid)){
			        SendClientMessage(playerid,COR_VERMELHO, "O jogador que você indicou não está conectado.");
			        return 1;
			    }
			    else{
			        if(GetDistanceBetweenPlayers(playerid,plid) > 20){
						SendClientMessage(playerid,COR_VERMELHO, "Chege mais perto para vender o bagulho.");
				    	return 1;
					} else {
			        	if(Cocaina[plid] == 7){
			         	  	SendClientMessage(playerid,COR_VERMELHO, "Você quer matar seu cliente!");
					    	return 1;
						} else {
					    	Cocaina[plid] = mili;
					    	SendClientMessage(playerid,COR_VERDE, "Missão cumprida!");
					    	format(msg,sizeof(msg),"Seu pulmão está carregado com %d doses de cocaína.",mili);
					    	SendClientMessage(plid,COR_BRANCO,msg);
						    return 1;
						}
					}
				}
			}
		} else {
		SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
		return 1;
		}
	}
	if(strcmp(cmd, "/vendergas", true) == 0) {
		if(IsPlayerAdmin(playerid)||Profissao[playerid] == BDR || Profissao[playerid] == FRENTISTA){
			new tmp[256];
			new msg[256];
			new petroleo;
			new plid, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/vendergas [id] [quantidade]");
		    	return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vendergas [id] [quantidade]");
		    	return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Quantidade inválida. Os valores devem ser de 1 à 100.");
		    	return 1;
			}
			if(IsPlayerConnected(plid)){
			if((Petrol[plid] + comb) < 100){
			    petroleo = Petrol[plid] + comb;
			    udb_setGasoline(PlayerName(plid), petroleo);
				Petrol[plid] = petroleo;
				format(msg,sizeof(msg),"Um admin do [BDR]RPG Rules Brasil™ botou no seu tanque %d litros de combustível em seu tanque, seu combustível é de %d litros",comb,petroleo);
				SendClientMessage(plid,COR_VERDE,msg);
				SendClientMessage(plid,COR_VERDE,"Economize o quanto poder!");
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido.");
				printf("O admin %s (ID %d) colocou %d litros de combustível no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
		    	return 1;
			}
			else if((Petrol[plid] + comb) >= 100){
			    udb_setGasoline(PlayerName(plid), 100);
				petroleo = 100 - Petrol[plid];
				Petrol[plid] = 100;
				format(msg,sizeof(msg),"Um admin do [BDR]RPG Rules Brasil™ completou seu tanque, colocando %d litros",petroleo);
				SendClientMessage(plid,COR_VERDE,msg);
				SendClientMessage(plid,COR_VERDE,"Economize o quanto poder!");
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido.");
		 		printf("O admin %s (ID %d) completou o combustível de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
		    	return 1;
			    }
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		    	return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
		    printf("O jogador %s (ID %d) tentou modificar o combustível de alguém, mas não possui permissão",PlayerName(playerid),playerid);
	    	return 1;
		}
	}

    if(strcmp(cmd, "/setcomb", true) == 0) {
		if(IsPlayerAdmin(playerid)||Profissao[playerid] == BDR){
			new tmp[256];
			new msg[256];
			new petroleo;
			new plid, comb;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/setcomb [ID] [quantidade]");
		    	return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcomb [ID] [quantidade]");
		    	return 1;
			}
			comb = strval(tmp);
			if(comb > 100 || comb <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Quantidade inválida. Os valores devem ser de 1 à 100.");
		    	return 1;
			}
			if(IsPlayerConnected(plid)){
			if((Petrol[plid] + comb) < 100){
			    petroleo = Petrol[plid] + comb;
			    udb_setGasoline(PlayerName(plid), petroleo);
				Petrol[plid] = petroleo;
				format(msg,sizeof(msg),"Um admin do [BDR]RPG Rules Brasil™ botou no seu tanque %d litros de combustível em seu tanque, totalizando %d litros",comb,petroleo);
				SendClientMessage(plid,COR_VERDE,msg);
				SendClientMessage(plid,COR_VERDE,"Economize o quanto poder!");
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido.");
				printf("O admin %s (ID %d) colocou %d litros de combustível no tanque de %s (ID %d), totalizando %d litros",PlayerName(playerid),playerid,comb,PlayerName(plid),plid,petroleo);
		    	return 1;
			}
			else if((Petrol[plid] + comb) >= 100){
			    udb_setGasoline(PlayerName(plid), 100);
				petroleo = 100 - Petrol[plid];
				Petrol[plid] = 100;
				format(msg,sizeof(msg),"Um admin do [BDR]RPG Rules Brasil™ completou seu tanque, colocando %d litros",petroleo);
				SendClientMessage(plid,COR_VERDE,msg);
				SendClientMessage(plid,COR_VERDE,"Economize o quanto poder!");
				SendClientMessage(playerid,COR_VERDE,"Combustível fornecido.");
		 		printf("O admin %s (ID %d) completou o combustível de %s (ID %d) colocando %d litros",PlayerName(playerid),playerid,PlayerName(plid),plid,petroleo);
		    	return 1;
			    }
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		    	return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
		    printf("O jogador %s (ID %d) tentou modificar o combustível de alguém, mas não possui permissão",PlayerName(playerid),playerid);
	    	return 1;
		}
	}
    if(strcmp(cmd, "/registrar", true) == 0 || strcmp(cmd, "/register", true) == 0) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
    	if (udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está registrado");
	    	return 1;
		}

    	if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está logado");
		    return 1;
		}

    	if (strlen(tmp)==0) {
			SendClientMessage(playerid, COR_VERMELHO, "Você esqueceu de digitar a senha. Use /registrar [senha]");
	    	return 1;
		}

    	else{
    	    PLAYERLIST_authed[playerid] = 1;

//========================================================================================================================================================================================================================================================================================================== Coordenas X Y e Z =================================================//
			udb_Create(PlayerName(playerid), tmp /*senha*/,0 /*créditos*/, 300 /*Dinheiro no bolso*/, 72 /*Skin*/, 700 /*Dinheiro no banco*/, 0 /*gasolina*/, 0 /*habilitação aérea*/, 0 /*habilitação terrestre*/, 0 /*Habilitação Náutica*/, 0 /*preso*/, 1 /*profissão*/, ""/*clantag*/, 1787.0270/*X*/, -1383.2040/*Y*/, 15.7578/*Z*/, 90.0000/*Ângulo*/, 100.0 /*Vida*/); //
//============================================================================================================================================================================================================================================================================================================================================================================//

			new Float:X, Float:Y, Float:Z, Float:ang;
			udb_getPosition(PlayerName(playerid), X, Y, Z);
			udb_getAng(PlayerName(playerid), ang);
			udb_setGasoline(PlayerName(playerid), 100);
			Petrol[playerid] = 100;

//======================================================== Ângulo X Y Z =====================================//
			SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);   //
//=========================================================================================================//

			SpawnPlayer(playerid);
			SetPlayerColor(playerid, COR_DESEMPREGADO);
			SendClientMessage(playerid, COR_AMARELO, "|_________[BDR]RPG RULES BRASIL™__________|");
			SendClientMessage(playerid, COR_VERDE, "Verifique profissões disponíveis, /profs");
			SendClientMessage(playerid, COR_VERMELHO, "Só dirija: lambretas, bugs, biciletas, karts, carros de golf e quadriciclos.");
			//SendClientMessage(playerid, COR_VERMELHO, "");//
			SendClientMessage(playerid, COR_VERDE, "Se precisa de alguma coisa use /ajuda e /aprender.");
			printf("O jogador %s (ID %d) acabou de se registrar",PlayerName(playerid),playerid);
			//#if bothipandidchat
			//format(string,sizeof(string),"[ID:%d] [IP:%s] %s: %s",playerid,plrIP,string,text);//
        	return 1;
		}
 	}
 	if(strcmp(cmd, "/logar", true) == 0 || strcmp(cmd, "/login", true) == 0 && IsPlayerConnected(playerid)) {
		new tmp[256];
		tmp = strtok(cmdtext, idx);
	    if (!udb_Exists(PlayerName(playerid))) {
			SendClientMessage(playerid, COR_VERMELHO, "Você não está registrado no [BDR]RPG Rules Brasil™!");
		    return 1;
		}

	    if (PLAYERLIST_authed[playerid] == 1) {
			SendClientMessage(playerid, COR_VERMELHO, "Você já está logado no [BDR]RPG Rules Brasil™!");
		    return 1;
		}

	    if (strlen(tmp)==0) {
			SendClientMessage(playerid, COR_VERMELHO, "/logar [senha]");
		    return 1;
		}

	    if (udb_CheckLogin(PlayerName(playerid),tmp)) {
			PLAYERLIST_authed[playerid] = 1;
			LogarPlayer(playerid);
			printf("O jogador %s (ID %d) acabou de se logar",PlayerName(playerid),playerid);
		    return 1;
		}
		else {

			SendClientMessage(playerid, COR_VERMELHO, "A senha digitada está incorreta!");
	    	return 1;
	    }
	}

	if(strcmp(cmd, "/logarplayer", true) == 0){
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			plid = strval(tmp);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/logarplayerid [ID]");
            return 1;
            }
            if(IsPlayerConnected(plid) == 0){
            SendClientMessage(playerid,COR_VERMELHO,"ID inválido");
            return 1;
			}
			else {
			LogarPlayer(plid);
			SendClientMessage(playerid,COR_VERDE,"[BDR]RPG Rules Brasil™, Player Logado Com Sucesso.");
			return 1;
			}
		}
			else {
				SendClientMessage(playerid, COR_VERMELHO, "Você não é admin, portanto, não tem permissão para fazer isso");
				return 1;
	        	}
	}
    
	if(strcmp(cmd, "/casa", true) == 0) {
	    if(IsPlayerAdmin(playerid)){
			new nome[256];
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/casa [Nick]");
				return 1;
			}
    		if (udb_Exists(tmp)) {
		        new Float:X, Float:Y, Float:Z;
		        new File:temp;
	      		new string[256];
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(tmp, X, Y, Z);
			    udb_setAng(tmp, 0);
			    SendClientMessage(playerid, COR_VERDE, "Casa setada com sucesso no [BDR]RPG Rules Brasil™");
				printf("%s acaba de vender um imóvel para %s",PlayerName(playerid),tmp);
				format(string, sizeof(string), "%f, %f, %f, //%s\r\n", X, Y, Z, nome);
  				temp = fopen("pickups.rpg", io_append);
  	 			fwrite(temp, string);
				fclose(temp);
     	    	return 1;
    	    } else {
    	        SendClientMessage(playerid,COR_VERMELHO,"Este nome não consta registro no [BDR]RPG Rules");
    	        return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para executar este comando!");
			return 1;
		}
	}
    if(strcmp(cmd, "/hospedar", true) == 0) {
	    if(Profissao[playerid] == HOTELEIRO || Profissao[playerid] == BDR || Profissao[playerid] == CORRETOR || IsPlayerAdmin(playerid)){
			new tmp[256];
			tmp = strtok(cmdtext, idx);
		    if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/hospedar [Nick]");
	    		return 1;
			}
    		if (udb_Exists(tmp)) {
		        new Float:X, Float:Y, Float:Z;
				GetPlayerPos(playerid, X, Y, Z);
				udb_setPosition(tmp, X, Y, Z);
			    udb_setAng(tmp, 0);
			    SendClientMessage(playerid, COR_VERDE, "Hospedado com sucesso em um dos hotéis do [BDR]RPG Rules");
			    printf("%s acabou de hospedar o player %s",PlayerName(playerid),tmp);
    	        return 1;
    	    }
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/curativo", true) == 0) {
	    if(Profissao[playerid] == PARAMEDICO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/curativo [id]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Missão cumprida!");
			    	SendClientMessage(plid, COR_BRANCO, "Um paramédico deu a você 100 de vida!");
			    	SetPlayerHealth(plid,100);
			    	GivePlayerMoney(playerid,100);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para aplicar o curativo!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas paramédicos podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/skin", true) == 0) {
	   new tmp[256];
	   new skin;
	   tmp = strtok(cmdtext,idx);
	   skin = strval(tmp);
	   if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==273 || skin==274 || skin==289 || skin>=300 || skin>=51313531){
       SendClientMessage(playerid,COR_VERMELHO, "A skin que você selecionou não é válida");
	   return 1;
	   }
	   udb_setSkin(PlayerName(playerid),skin);
	   SetPlayerSkin(playerid, skin);
	   SendClientMessage(playerid,COR_AZULPLUS, "Skin modificada com sucesso!");
	   return 1;
	   }

    if(strcmp(cmd, "/meuskin", true) == 0) {
	   new tmp[256];
	   new skin;
	   tmp = strtok(cmdtext,idx);
	   skin = strval(tmp);
	   if(skin==3 || skin==4 || skin==5 || skin==6 || skin==8 || skin==42 || skin==65 || skin==74 || skin==86 || skin==119 || skin==149 || skin==208 || skin==273 || skin==274 || skin==289 || skin>=300 || skin>=51313531){
       SendClientMessage(playerid,COR_VERMELHO, "A skin que você selecionou não é válida");
	   return 1;
	   }
	   udb_setSkin(PlayerName(playerid),skin);
	   SetPlayerSkin(playerid, skin);
	   SendClientMessage(playerid,COR_AZULPLUS, "Skin modificada com sucesso!");
	   return 1;
	   }

    if(strcmp(cmd, "/admincomandos", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
		SendClientMessage(playerid, COR_VERDE, "Comandos de administrador do [BDR]RPG Rules Brasil™ Parte 1");
		SendClientMessage(playerid, COR_AMARELO, "/rcon login [senha rcon] : Loga como admin");
        SendClientMessage(playerid, COR_AMARELO, "/setcomb: [id do player] e [quantidade de combustivel pro player]");
        SendClientMessage(playerid, COR_AMARELO, "/setprof: [id do player] e [id da profissao]");
        SendClientMessage(playerid, COR_AMARELO, "/setskin: [id do player] e [id da skin]");
        SendClientMessage(playerid, COR_AMARELO, "/casa [Nick]:Seta uma casa pra alguem");
        SendClientMessage(playerid, COR_AMARELO, "/godc: Carro no modo deus (nunca explode)");
        SendClientMessage(playerid, COR_AMARELO, "/godmode: Você em modo deus (nunca morre)");
		SendClientMessage(playerid, COR_AMARELO, "/godmodeoff: Desliga o modo deus");
        SendClientMessage(playerid, COR_AZUL, "Para mais comandos de admin /admincomandos2");
		return 1;
      }
	}
    if(strcmp(cmd, "/admincomandos2", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
		SendClientMessage(playerid, COR_VERDE, "Comandos de administrados do [BDR]RPG Rules Brasil™ Parte 2");
		SendClientMessage(playerid, COR_AMARELO, "/vida [ID]: Completa a vida de alguem");
		SendClientMessage(playerid, COR_AMARELO, "/colete: Dá colete ao admin");
		SendClientMessage(playerid, COR_AMARELO, "/lchat: Limpa a janela de texto");
        return 1;
      }
   }
	if(strcmp(cmd, "/lchat", true) == 0) {
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR){
		SendClientMessage(playerid, COR_PRETO, "C ");
		SendClientMessage(playerid, COR_PRETO, " H");
		SendClientMessage(playerid, COR_PRETO, "A ");
		SendClientMessage(playerid, COR_PRETO, " T");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " A");
		SendClientMessage(playerid, COR_PRETO, "P ");
		SendClientMessage(playerid, COR_PRETO, " A");
		SendClientMessage(playerid, COR_PRETO, "G ");
		SendClientMessage(playerid, COR_PRETO, " A");
		SendClientMessage(playerid, COR_PRETO, "D ");
		SendClientMessage(playerid, COR_PRETO, " O");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, " ");
		SendClientMessage(playerid, COR_PRETO, "CHAT APAGADO ");
		return 1;
		}}
	if(strcmp(cmd, "/bdr", true) == 0) {
		SendClientMessage(playerid, COR_VERDE, "Quer ser do Clan [BDR]?");
        SendClientMessage(playerid, COR_AMARELO, "Bom visite o site www.bdr-clan.official.ws");
        SendClientMessage(playerid, COR_AMARELO, "Quer ver o BLOG BDR? www.clandosbdr.blogueiros.net");
        SendClientMessage(playerid, COR_AMARELO, "No site da BDR www.bdr-clan.official.ws vc vê como ser do clan");
        SendClientMessage(playerid, COR_AMARELO, "Depois de preecher o formulário no site fale com o admin online");
        SendClientMessage(playerid, COR_AMARELO, "Em seguida peça pra ele fazer um teste e diga qual batalhao escolheu");
        SendClientMessage(playerid, COR_AZUL, "Boa sorte e divirta-se!!");
		return 1;
		}
	if(strcmp(cmd, "/regras", true) == 0) {
		SendClientMessage(playerid, COR_VERDE, "Regras do RPG [BDR]RPG Rules");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº1: Não use cheaters no RPG");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº2: Não mate no banco e/ou no hospital");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº3: Não cometa DB(Drive-By) se não quiser ser banido");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº4: É explicitamente proibido fazer spam(Propaganda)");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº5: Não use bots se houver suspeitas de bots baniremos quem botou os bots e os bots");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº6: Se você matar sem motivo será preso, se for solto e voltar a matar será kikado");
		SendClientMessage(playerid, COR_AMARELO,"Regra nº7: Todos os administradores devem ser responsáveis e não utilizar de Power Abuse");
        SendClientMessage(playerid, COR_AMARELO,"Regra nº8: Nenhum administrador pode chingar, não pode matar de minigun e não pode banir sem motivo");
		return 1;
	}
    if(strcmp(cmd, "/precoscarros", true) == 0) {
    SendClientMessage(playerid, COR_VERDE, "Tabelo de preços de Carros do [BDR]RPG Rules");
    SendClientMessage(playerid, COR_AMARELO, "Sedans 2 Portas: R$ 29000");
    SendClientMessage(playerid, COR_AMARELO, "Sedans 4 Portas de Luxo: R$45000");
    SendClientMessage(playerid, COR_AMARELO, "Carros Muscle (Fortes): R$60000");
    SendClientMessage(playerid, COR_AMARELO, "Carros de Racha: R$ 90000");
    SendClientMessage(playerid, COR_AMARELO, "Carros Sport de Alta Performace: R$70000");
    SendClientMessage(playerid, COR_AMARELO, "Caminhões: R$ 40000");
	SendClientMessage(playerid, COR_AZUL, "Para mais preços digite:/precoscarros2");
	return 1;
	}
	if(strcmp(cmd, "/precoscarros2", true) == 0) {
	SendClientMessage(playerid, COR_VERDE, "Tabela de preços de Carros do [BDR]RPG Rules");
	SendClientMessage(playerid, COR_AMARELO, "Caminhonetes e Vans: R$ 7500");
    SendClientMessage(playerid, COR_AMARELO, "LowRiders: R$97000");
    SendClientMessage(playerid, COR_AMARELO, "Carros-Recreação: R$12000");
    SendClientMessage(playerid, COR_AMARELO, "Bikes e Motos: R$ 10000");
    SendClientMessage(playerid, COR_AMARELO, "Aviões/Helicopteros: R$ 990000");
    SendClientMessage(playerid, COR_AMARELO, "Barcos: R$15000");
    SendClientMessage(playerid, COR_AMARELO, "Veiculos quebrados(sem concerto): R$1000");
    SendClientMessage(playerid, COR_VERMELHO, "AVISO: Veiculos do governo e veiculos do serviço civil NÃO ESTÃO A VENDA!!");
    return 1;
    }
	if(strcmp(cmd, "/precoshab", true) == 0) {
    SendClientMessage(playerid, COR_VERDE, "Tabela de preços de Habilitações do [BDR]RPG Rules");
    SendClientMessage(playerid, COR_AZUL, "Para comprar habilitações sem ajuda de instrutor use: /licensas");
    SendClientMessage(playerid, COR_AMARELO, "Habilitação terrestre = Sem teste: R$1200 Com teste: R$800");
    SendClientMessage(playerid, COR_AMARELO, "Habilitação Náutica = Sem teste: R$2000 Com Teste: R$1000");
    SendClientMessage(playerid, COR_AMARELO, "Habilitação aérea = Sem teste R$2500 Com teste: R$1500");
    SendClientMessage(playerid, COR_AZUL, " Quem quiser todas as habilitações pagará: R$4400");
    return 1;
    }
    if(strcmp(cmd, "/licensas", true) == 0) {
    SendClientMessage(playerid, COR_VERDE, "Tabela de preços de Licensas do [BDR]RPG Rules");
    SendClientMessage(playerid, COR_AZUL, "Aqui você compra licensas por você mesmo mas com o preço mais caro");
    SendClientMessage(playerid, COR_AMARELO, "Habilitação terrestre = Sem teste: R$12000");
    SendClientMessage(playerid, COR_AMARELO, "Habilitção Náutica = Sem teste: R$20000");
    SendClientMessage(playerid, COR_AMARELO, "Habilitção aérea = Sem teste R$25000");
    SendClientMessage(playerid, COR_AZUL, "Use: /comprarterrestre, /compraraerea, /comprarnautica");
    SendClientMessage(playerid, COR_VERMELHO, "Não use isto se um instrutor estiver online, você estará perdendo dinheiro");
    return 1;
    }
	if(strcmp(cmd, "/creditosbdr", true) == 0) {
	    SendClientMessage(playerid, COR_VERDE, "[BDR]RPG Rules Brasil™");
	    SendClientMessage(playerid, COR_AMARELO, "[BDR]Clan ||| [BDR]RPG Rules Brasil™ ");
	    SendClientMessage(playerid, COR_AMARELO, "Criador do Game Mode: [BDR]Mac[BS]");
	    SendClientMessage(playerid, COR_AMARELO, "Copyright © 2005-2008, [BDR] Clan");
		SendClientMessage(playerid, COR_AMARELO, "Ajuda: [LoboMaster], Protioso, London & Matws1");
		SendClientMessage(playerid, COR_AMARELO, "Agradecimentos aos verdadeiros coders de RPG's: SolidNuts, Luigi e nunca esquecendo");
		SendClientMessage(playerid, COR_AMARELO, "Quem realmente deu vida a todos os RPG's existentes e quem sem ele não fariamos nada");
		SendClientMessage(playerid, COR_AMARELO, "O DracoBlue Criador do DUDB que faz os RPG's terem gasolina e etc..");
		SendClientMessage(playerid, COR_AMARELO, "Agradecemos a sua presença no servidor VOCÊ faz a diferença aqui!");
    	return 1;
	}
    if(strcmp(cmd, "/precos", true) == 0) {
        SendClientMessage(playerid, COR_VERDE, "Preços oficiais do [BDR]RPG Rules");
        SendClientMessage(playerid, COR_AMARELO, "/precoscarros: Lista de preços de Auto-Móveis parte 1 do [BDR]RPG Rules");
		SendClientMessage(playerid, COR_AMARELO, "/precoscarros2: Lista de preços de Auto-Móveis parte 2 do [BDR]RPG Rules");
		SendClientMessage(playerid, COR_AMARELO, "/precoshab: Lista de preços de habilitações do [BDR]RPG Rules");
		return 1;
    }
   	if(strcmp(cmd, "/revelar", true) == 0) {
	    SendClientMessage(playerid, COR_VERDE, "As fotos foram reveladas com sucesso!");
	    SendClientMessage(playerid, COR_AMARELO,"Foram colocadas no album San Andreas History!");
        return 1;
	}
	if(strcmp(cmd, "/aprender", true) == 0) {
	    SendClientMessage(playerid, COR_VERDE, "==========================|..::[BDR]RPG Rules::..|===============================");
	    SendClientMessage(playerid, COR_AZUL, "Isto é um RPG, ele simula a vida real e já que na vida real existem profissões...");
	    SendClientMessage(playerid, COR_AZUL, "Você pode escolher a profissão de seu gosto comprar casa carro etc mas como na vida real precisa dinheiro.");
	    SendClientMessage(playerid, COR_AZUL, "Na vida real existem ladrões e criminosos aqui tambem mas os policias tambem exitem então cuidado.");
		SendClientMessage(playerid, COR_AZUL, "Se dirigir sem habilitação, poderá pegar multa.Há 3 tipos de habilitação:");
		SendClientMessage(playerid, COR_AZUL, "Terrestre (veículos terrestres), Habilitação Náutica (veículos náuticos) e aérea (veículos aéreos).");
		SendClientMessage(playerid, COR_AZUL, "Espero que gostem do [BDR]RPG Rules e que voltem sempre que quiserem.");
		SendClientMessage(playerid, COR_AZUL, "Para escolher uma profissão: /profs.");
		SendClientMessage(playerid, COR_VERMELHO, "Quer Saber os Comandos? /ajuda.");
    	return 1;
	}
	if (strcmp(cmdtext, "/reparar", true)==0) {
    if(!IsPlayerInAnyVehicle(playerid))
	return
	SendClientMessage(playerid,COR_VERMELHO,"Você só pode usar este comando em um veículo.");
    SetVehicleHealth(GetPlayerVehicleID(playerid),1000.0);
    //RepairVehicle(GetPlayerVehicleID(playerid)); //retire se necessário
    return
	SendClientMessage(playerid,COR_AMARELO,"Voce reparou um veiculo com sucesso!");
    }

    if(strcmp(cmd, "/ajuda", true) == 0) {
		SendClientMessage(playerid, COR_VERDE, "|___Comandos do [BDR]RPG Rules Brasil___|");
		SendClientMessage(playerid, COR_AMARELO, "|_GERAL_| /profs  /transferir  /trancar  /destrancar  /mostrardocs /relogio /banco");
		SendClientMessage(playerid, COR_AMARELO, "|_GERAL_| /taxi  /pagar  /190  /presos  /procurados  /pescar  /profissao /precos");
        SendClientMessage(playerid, COR_AMARELO, "|_GERAL_| /creditosbdr  /rep /mp /193 /ejetar /saldocell");
		return 1;
	}
    if(strcmp(cmdtext, "/tunarcarro", true) == 0) {
        if(IsPlayerAdmin(playerid) || Profissao[playerid] == TUNADOR || Profissao[playerid] == BDR){
            new VehicleID;
            VehicleID = GetPlayerVehicleID(playerid);
			SendClientMessage(playerid, COR_VERDE, "Carro tunado com sucesso!");
            SetVehicleHealth(GetPlayerVehicleID(playerid),10000);
			AddVehicleComponent(VehicleID, 1087);
            AddVehicleComponent(VehicleID, 1080);
            AddVehicleComponent(VehicleID, 1010);
            SendClientMessage(playerid, COR_AZULPLUS, "Se não gostou da cor use: /pintar [cor1] e [cor2]");
			return 1;
       }
	}

	if(strcmp(cmd,"/banco",true) == 0) {
		if(AreaBanco[playerid] == 1){
        SendClientMessage(playerid, COR_VERDE, "Bancos 24Horas [BDR]RPG Rules Brasil™");
        SendClientMessage(playerid, COR_AMARELO, "Para depositos em dinheiro use: /depositar [Quantia]");
        SendClientMessage(playerid, COR_AMARELO, "Para retirar dinheiro do banco use: /sacar [Quantia]");
        SendClientMessage(playerid, COR_AMARELO, "Para ver qual seu saldo no banco use: /saldo");
        SendClientMessage(playerid, COR_AMARELO, "Se não estiver em um banco e precisa checar seu saldo use: /saldocell");
		return 1;
    }
        if(AreaBanco[playerid] == 1){
		SendClientMessage(playerid, COR_VERMELHO, "ATENÇÃO: Você não está em um Banco 24Horas [BDR]RPG Rules Brasil™");
		SendClientMessage(playerid, COR_VERDE, "Você precisa estar em um banco para usar os comandos, menos /saldocell");
        SendClientMessage(playerid, COR_VERDE, "Você tem dúvidas de onde fica um banco? ache no mapa um cifrão ( $ )");
        SendClientMessage(playerid, COR_AMARELO, "Se não achar o $ no mapa fale com o administrador presente ou com algum jogador");
    	return 1;
	}
 }

    if(strcmp(cmd, "/profissoes", true) == 0) {
		SendClientMessage(playerid, COR_VERMELHO, "Uso Correto: /profs");
		return 1;
    }
    if(strcmp(cmd, "/comandos", true) == 0) {
		SendClientMessage(playerid, COR_VERMELHO, "Uso Correto: /ajuda");
		return 1;
    }
    if(strcmp(cmd, "/empregos", true) == 0) {
		SendClientMessage(playerid, COR_VERMELHO, "Uso Correto: /profs");
		return 1;
	}
	if(strcmp(cmd, "/profs", true) == 0) {
		SendClientMessage(playerid, COR_VERMELHO, "Pergunte ao administrador online também visto em /admins");
		SendClientMessage(playerid, COR_VERMELHO, "Quais profissões são liberadas e quais são promoções");
		SendClientMessage(playerid, COR_VERMELHO, "Exemplo: Você precisa ser policial antes de ser do BOPE que é promoção...");
		SendClientMessage(playerid, COR_VERMELHO, "Se tentar enganar o administraodor corre risco de ser kikado ou até mesmo banido!");
		SendClientMessage(playerid, COR_VERMELHO, "Para ver as profissões use: /profs1 e etc...");
		return 1;
    }
	if(strcmp(cmd, "/profs1", true) == 0) {
        SendClientMessage(playerid, COR_VERDE, "Profissões disponíveis no [BDR]RPG Rules Parte 1");
        SendClientMessage(playerid, COR_DESEMPREGADO, "1 - Desempregado (Acaba de chegar na cidade)(Salário: $800)");
        SendClientMessage(playerid, COR_TAXISTA, "2 - Taxista (Salário: $900)");
        SendClientMessage(playerid, COR_VENDEDOR, "3 - Vendedor de veículos (Salário: $200 + O que ganhar vendendo carros)");
        SendClientMessage(playerid, COR_CORRETOR, "4 - Corretor de imóveis (Salário: $200 + O que ganhar vendendo casas)");
        SendClientMessage(playerid, COR_ASSASSINO, "5 - Assassino (Salário: O Dinheiro de quem você matar)");
        SendClientMessage(playerid, COR_BARMAN, "6 - Barman (Salário: $850 + As bebidas que vender)");
        SendClientMessage(playerid, COR_JUIZ, "7 - Juiz (Salário: $2000 + Casos com subornos)");
        SendClientMessage(playerid, COR_SEGURANÇA, "8 - Segurança (Salário: $850 + O que o patrão pagar)");
        SendClientMessage(playerid, COR_AZUL, "Para mais profissões, escreva /profs2");
    	return 1;
	}
	if(strcmp(cmd,"/profs2",true)==0){
	    SendClientMessage(playerid, COR_VERDE, "Profissões disponíveis no [BDR]RPG Rules Parte 2");
	    SendClientMessage(playerid, COR_MOTORISTA, "9 - Motorista Particular (Salário: $850 + O que o patrão pagar)");
	    SendClientMessage(playerid, COR_COP_CIVIL, "10 - Polícia Civil (Salário: $1200)");
	    SendClientMessage(playerid, COR_COP_RODOVIARIO, "11 - Policial Rodoviário (Salário: $1200)");
	    SendClientMessage(playerid, COR_COP_ELITE, "12 - BOPE (Salário: $3000)");
	    SendClientMessage(playerid, COR_CACADOR, "13 - Caçador (Salário: $1000)");
	    SendClientMessage(playerid, COR_PESCADOR, "14 - Pescador (Salário: $750 + O que ganhar em cada pesca)");
	    SendClientMessage(playerid, COR_INSTRUTOR, "15 - Instrutor de Direção (Salário: $600 + O que ganhar vendendo habilitações)");
	    SendClientMessage(playerid, COR_TRAFICANTE, "16 - Traficante (Salário: $1200 + O que ganhar na venda de drogas)");
	    SendClientMessage(playerid, COR_AZUL, "Para mais profissões, escreva /profs3");
    	return 1;
	}
	if(strcmp(cmd,"/profs3",true)==0){
	    SendClientMessage(playerid, COR_VERDE, "Profissões disponíveis no [BDR]RPG Rules Parte 3");
	    SendClientMessage(playerid, COR_MOTORISTA_ONIBUS, "17 - Motorista de ônibus (Salário: $900)");
	    SendClientMessage(playerid, COR_JORNALISTA, "18 - Jornalista (Salário: $1150)");
	    SendClientMessage(playerid, COR_CAMINHONEIRO, "19 - Caminhoneiro (Salário: $400 + O que ganha por carga)");
	    SendClientMessage(playerid, COR_NARCOTICOS, "20 - Narcóticos (Salário: $4000)");
	    SendClientMessage(playerid, COR_POLICIA_FLORESTAL, "21 - Polícia Florestal (Salário: $2500)");
	    SendClientMessage(playerid, COR_IBAMA, "22 - IBAMA (Salário: $2500)");
	    SendClientMessage(playerid, COR_ADVOGADO, "23 - Advogado (Salário: $1000 + Causas ganhas)");
	    SendClientMessage(playerid, COR_BRANCO, "24 - Paramédico (Salário: $900 + Trabalhos para salvar vidas)");
	    SendClientMessage(playerid, COR_AZUL, "Para mais profissões, escreva /profs4");
    	return 1;
	}

	if(strcmp(cmd,"/profs4",true)==0){
	    SendClientMessage(playerid, COR_VERDE, "Profissões disponíveis no [BDR]RPG Rules Parte 4");
	    SendClientMessage(playerid, COR_SORVETEIRO, "25 - Vendedor de Sorvete (Salário: $900)");
	    SendClientMessage(playerid, COR_HOT_DOG, "26 - Vendedor de Hot Dog (Salário: $900)");
	    SendClientMessage(playerid, COR_MOTOBOY, "27 - Moto Boy (Salário: $1000)");
	    SendClientMessage(playerid, COR_TAXI_AEREO, "28 - Taxista aéreo (Salário: $1200)");
	    SendClientMessage(playerid, COR_ENTREGADOR_PIZZA, "29 - Entregador de Pizza (Salário: $900 + o que ganhar pelas pizzas)");
	    SendClientMessage(playerid, COR_PRESIDENTE, "30 - Presidente (Salário $9000)");
	    SendClientMessage(playerid, COR_LADRAO_CARROS, "31 - Ladrão de carros (Salário $5000)");
 	    SendClientMessage(playerid, COR_AZUL, "Para mais profissões /profs5:.");
    	return 1;
    }

   	if(strcmp(cmd,"/profs5",true)==0){
        SendClientMessage(playerid, COR_VERDE, "Profissões disponíveis no [BDR]RPG Rules Parte 5");
        SendClientMessage(playerid, COR_PREFEITO, "32 - Prefeito (Salário $3080)");
        SendClientMessage(playerid, COR_AGRICULTOR, "33 - Agricultor (Salário $800 + o que plantar)");
        SendClientMessage(playerid, COR_COP_ELITE, "34 - Governador (Salário $4500)");
        SendClientMessage(playerid, COR_DEPUTADO,"35 - Deputado (Salário $3700)");
        SendClientMessage(playerid, COR_TUNADOR,"36 - Tunador/Mecânico (Salário $1100 + O que ganhar tunando e consertando carros)");
		SendClientMessage(playerid, COR_BDR,"37 - [BDR]Game Master (Salário $10000)");
        SendClientMessage(playerid, COR_EXERCITO, "38 - Exército (salário $4000)");
	    SendClientMessage(playerid, COR_AZUL, "Para mais profissões /profs6:.");
		return 1;
    }
    if(strcmp(cmd,"/profs6",true)==0){
	 SendClientMessage(playerid, COR_VERDE, "Profissões Disponíveis no [BDR]RPG Rules Parte 6");
     SendClientMessage(playerid, COR_CHERIFE, "39 - Cherife (sálario $2000)");
     SendClientMessage(playerid, COR_COP_CORRUPTO, "40 - Polcial Corrupto (Salário $1200 + Venda dos bagulhos (drogas) )");
     SendClientMessage(playerid, COR_FOTOGRAFO, "41 - Fotografo (Salário $900 + As fotos reveladas)");
	 SendClientMessage(playerid, COR_MATADOR_DE_ALUGUEL, "42 - Matador de Aluguel (Salário $4000 + O que pagarem pelas mortes)");
     SendClientMessage(playerid, COR_HOTELEIRO, "43 - Hoteleiro (Salário $1500 + Hospedagens)");
	 SendClientMessage(playerid, COR_REI_DO_CRIME, "44 - Rei do Crime (Salário $5000)");
	 SendClientMessage(playerid, COR_FRENTISTA, " 45 - Frentista  (Salário $950 + Tanques que encher)");
	 SendClientMessage(playerid, COR_AZUL, "Para mais profissões /profs7:.");
	 return 1;
	}
	if(strcmp(cmd,"/profs7",true)==0){
	 SendClientMessage(playerid, COR_VERDE, "Profissões Disponíveis no [BDR]RPG Rules 7");
     SendClientMessage(playerid, COR_PADRE, " 46 - Padre Quemedo (Salário $2500 + O que quem casar pagar)");
	 SendClientMessage(playerid, COR_BOMBEIRO, " 47 - Bombeiro (Salário $1500)");
	 SendClientMessage(playerid, COR_RAPPER, " 48 - Rapper (Salário $4000 + As festas onde cantar)");
	 SendClientMessage(playerid, COR_HOMEM_BOMBA, " 49 - Homem Bomba (Salário $1000 + Quem pagar pra você explodir alguma coisa o.O)");
	 SendClientMessage(playerid, COR_BOXE, " 50 - Lutador de Boxe (Salário $3500 + As lutas que ganhar)");
	 SendClientMessage(playerid, COR_COMERCIO, " 51 - Comerciante do Camelódromo (Salário $1200)");
	 SendClientMessage(playerid, COR_ASSALTANTE, " 52 - Assaltante (Salário $1000 + o que ganhar assaltando bancos)");
	 SendClientMessage(playerid, COR_AZUL, "Para mais profissões /profs8:.");
	 return 1;
	}
    if(strcmp(cmd,"/profs8",true)==0){
	 SendClientMessage(playerid, COR_VERDE, "Profissões Disponíveis no [BDR]RPG Rules 8");
     SendClientMessage(playerid, COR_MARINHA, " 53 - Marinha (Salário $1500)");
	 SendClientMessage(playerid, COR_FBI, " 54 - Agente do FBI (Salário $1600)");
	 SendClientMessage(playerid, COR_MOTORISTA_TREM, "55 - Motorista de Trem (Salário $2000 + Quem transportar) ");
	 SendClientMessage(playerid, COR_CIA, "56 - Agente da CIA (Salário $1700)");
	 SendClientMessage(playerid, COR_SWAT, "57 - SWAT (Salário $3500)");
	 SendClientMessage(playerid, COR_KGB, "58 - KGB (Salário $4000)");
	 SendClientMessage(playerid, COR_GANG_RIFA, "59 - Gangue Rifa (Salário $2000 + o que ganhar roubando e dividindo o roubo)");
     SendClientMessage(playerid, COR_AZUL, "Para mais profissões /profs9:.");
	 return 1;
	}
    if(strcmp(cmd,"/profs9",true)==0){
	 SendClientMessage(playerid, COR_VERDE, "Profissões Disponíveis no [BDR]RPG Rules Parte 9");
	 SendClientMessage(playerid, COR_DETETIVE, "60 - Detetive (Salário $3000 + Os casos que desvendar)");
	 SendClientMessage(playerid, COR_VL, "61 - Gangue Vida Loka (Salário R$1893 + o que ganhar com seus trabalhos) ");
     SendClientMessage(playerid, COR_FISCAL_DETRAN, "62 - Fiscal do Detran (Salário 900 + O que ganhar tirando carteiras)");
     SendClientMessage(playerid, COR_COP_MILITAR, "63 - Polcial Militar (Salário $1200)");
     SendClientMessage(playerid, COR_VENDEDOR_DE_ARMAS, "64 - Vendedor de Armas (Salário $1500 + Armas que vender)");
	 SendClientMessage(playerid, COR_AZUL, "Para escolher uma profissão digite: /rep [Nome da prof] [ID da prof]");
	 SendClientMessage(playerid, COR_AMARELO, "Desculpe, não temos mais profissões mas estamos criando muito mais!");
	 return 1;
    }
	if (strcmp(cmd, "/taxi", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 5, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/taxi [Local]");
	    	return 1;
		}
		else{
		    SendClientMessage(playerid, COR_AMARELO, "Taxistas foram informados.");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == TAXISTA || IsPlayerAdmin(playerid)){
					format(string, sizeof(string), "%s pediu um taxi. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_AMARELO, string);
					return 1;
		        }
			}
		}
	}

	if (strcmp(cmd, "/190", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/190 [Denuncia]");
	    	return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERDE, "Autoridades foram informadas, obrigado!");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_MILITAR || Profissao[i] == DETETIVE || Profissao[i] == KGB || Profissao[i] == SWAT || Profissao[i] == BDR || Profissao[i] == CIA || Profissao[i] == FBI || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE || Profissao[i] == CHERIFE || Profissao[i] == EXERCITO || IsPlayerAdmin(i)){
					format(string, sizeof(string), "%s ligou para o 190 informando: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_VERMELHO, string);
					return 1;
		        }
			}
		}
	}


    if(strcmp(cmd, "/rep", true) == 0) {

		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/rep [Texto]");
	    	return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERDE, "Um administrador do [BDR]Clan foi informado!");
		    SendClientMessage(playerid, COR_VERDE, "Não gosta do atendimento no RPG? vá na comunidade da BDR");
		    SendClientMessage(playerid, COR_VERDE, "LINK: http://www.orkut.com.br/Community.aspx?cmm=48005825");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) || Profissao[i] == BDR){
					format(string, sizeof(string), "%s fez um reporte para você administrador: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_VERMELHO, string);
					format(string, sizeof(string), "%s fez um reporte para você administrador: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_VERMELHO, string);
					SendClientMessage(i, COR_VERDE, "Isto foi floodado automaticamente para que os administradores façam algo!!!");
                    return 1;
		        }
			}
		}
	}


	if (strcmp(cmd, "/193", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 4, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/193 [local]");
		    return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERDE, "Os paramédicos foram informados");
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(IsPlayerAdmin(i) == 1 || Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_ELITE){
					format(string, sizeof(string), "%s está pedindo uma ambulância urgente. Local: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, COR_COP_ELITE, string);
					return 1;
		        }
			}
		}
	}
    if (strcmp(cmdtext, "/trancar", true)==0)
	{
    	new State;
    	new Float:X;
    	new Float:Y;
	    new Float:Z;
		if(IsPlayerInAnyVehicle(playerid))
		{
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COR_VERMELHO,"Você só pode trancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				if(i != playerid)
				{
					SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 1);
				}
			}
			SendClientMessage(playerid, COR_COP_ELITE, "Veículo trancado!");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1056,X,Y,Z);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está em nenhum veículo!");
			return 1;
		}
	}
	if (strcmp(cmdtext, "/destrancar", true)==0)
	{
    	new State;
    	new Float:X;
    	new Float:Y;
    	new Float:Z;
		if(IsPlayerInAnyVehicle(playerid))
		{
			State=GetPlayerState(playerid);
			if(State!=PLAYER_STATE_DRIVER)
			{
				SendClientMessage(playerid,COR_VERMELHO,"Você só pode destrancar as portas se estiver dirigindo.");
				return 1;
			}
			new i;
			for(i=0;i<MAX_PLAYERS;i++)
			{
				SetVehicleParamsForPlayer(GetPlayerVehicleID(playerid),i, 0, 0);
			}
			SendClientMessage(playerid, COR_COP_ELITE, "Veículo destrancado!");
			GetPlayerPos(playerid,X,Y,Z);
			PlayerPlaySound(playerid,1057,X,Y,Z);
			return 1;
		}
		else
		{
			SendClientMessage(playerid, COR_VERMELHO, "Você não está em nenhum veículo!");
			return 1;
		}
	}
	if(strcmp(cmd,"/vsorvete",true)==0){
	    if(Profissao[playerid] == SORVETEIRO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
	        	SendClientMessage(playerid,COR_VERMELHO,"/vsorvete [id]");
				return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(GetDistanceBetweenPlayers(plid,playerid) > 30){
			        SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto.");
					return 1;
				}
				else {
				    SendClientMessage(playerid,COR_SORVETEIRO,"Sorvete vendido.");
				    SendClientMessage(plid,COR_SORVETEIRO,"Você se deliciou com um sorvete de chocolate.");
				    GivePlayerMoney(playerid,10);
				    GivePlayerMoney(plid,-10);
				    SetPlayerHealth(plid,100);
					return 1;
				}
			}
			else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
			}
		}
		else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão para isso!");
			return 1;
		}
	}
    if(strcmp(cmd,"/horario",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256];
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COR_VERMELHO,"/horario [Horas]");
			return 1;
		}
		if(strval(tmp) > 23 || strval(tmp) < 0){
		    SendClientMessage(playerid,COR_VERMELHO,"Valores de 0 à 23");
		    return 1;
		} else {
		    worldTime = strval(tmp);
		    SetWorldTime(worldTime);
		    return 1;
		}
	}
	
	if(strcmp(cmd,"/tempo",true)==0 && IsPlayerAdmin(playerid)){
	    new tmp[256];
	    new Clima;
		tmp = strtok(cmdtext,idx);
		if(!strlen(tmp)){
		    SendClientMessage(playerid,COR_VERMELHO,"/tempo [0 à 169]");
			return 1;
		}
		if(strval(tmp) > 169 || strval(tmp) < 0){
		    SendClientMessage(playerid,COR_VERMELHO,"Valores de 0 à 169");
		    return 1;
		} else {
		    Clima = strval(tmp);
		    SetWeather(Clima);
		    return 1;
		}
	}

	if(strcmp(cmd,"/vhotdog",true)==0){
	    if(Profissao[playerid] == HOT_DOG || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	tmp = strtok(cmdtext,idx);
	    	if(!strlen(tmp)){
    		SendClientMessage(playerid,COR_VERMELHO,"/vhotdog [id]");
			return 1;
			}
			plid = strlen(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[plid] == 1){
			    if(GetDistanceBetweenPlayers(plid,playerid) > 30){
			        SendClientMessage(playerid,COR_VERMELHO,"Você esta muito longe chegue mais perto.");
					return 1;
				}
				else {
				    SendClientMessage(playerid,COR_HOT_DOG,"Hot dog vendido.");
				    SendClientMessage(plid,COR_HOT_DOG,"Você se deliciou com um Hot Dog.");
				    GivePlayerMoney(playerid,10);
				    GivePlayerMoney(plid,-10);
				    SetPlayerHealth(plid,100);
					return 1;
				}
			}
			else {
			    SendClientMessage(playerid,COR_VERMELHO,"Jogador não conectado/logado");
				return 1;
			}
		}
		else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão.");
			return 1;
		}
	}
	if(strcmp(cmd,"/multavelo",true)==0){
		if(IsPlayerAdmin(playerid)|| Profissao[playerid] == BDR){
		    if(VeloMulta == 1){
		        SendClientMessage(playerid,COR_VERMELHO,"Multa por velocímetro desligada.");
				VeloMulta = 0;
		    	return 1;
			} else {
			    SendClientMessage(playerid,COR_VERMELHO,"Multa por velocímetro ligada.");
			    VeloMulta = 1;
		    	return 1;
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não é um administrador!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/transferir", true) == 0) {
		new string[256];
	    new tmp[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/transferir [ID] [Quantia]");
	    	return 1;
		}
		giveplayerid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/transferir [ID] [Quantia]");
	    	return 1;
		}
 		moneys = strval(tmp);
		if (IsPlayerConnected(giveplayerid)) {
			GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
			GetPlayerName(playerid, sendername, sizeof(sendername));
			playermoney = GetPlayerMoney(playerid);
			if (moneys > 0 && playermoney >= moneys) {
				GivePlayerMoney(playerid, (0 - moneys));
				GivePlayerMoney(giveplayerid, moneys);
				format(string, sizeof(string), "Você enviou a %s (ID: %d) a importância de R$%d.", giveplayer,giveplayerid, moneys);
				SendClientMessage(playerid, COR_AMARELO, string);
				format(string, sizeof(string), "Você recebeu R$%d de %s (ID: %d).", moneys, sendername, playerid);
				SendClientMessage(giveplayerid, COR_AMARELO, string);
				printf("%s acaba de transferir $%d para %s",sendername,moneys,giveplayer);
			}
			else {
				SendClientMessage(playerid, COR_AMARELO, "Valor inválido.");
			}
		}
		else {
			format(string, sizeof(string), "%d não está online.", giveplayerid);
			SendClientMessage(playerid, COR_AMARELO, string);
			return 1;
		}
	}

    if(strcmp(cmd, "/depositar", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "/depositar [Quantia]");
	    	return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || quantidade > GetPlayerMoney(playerid)){
	        SendClientMessage(playerid, COR_VERMELHO, "Banco: Você está tentando depositar uma quantia inválida.");
	    	return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
	        GivePlayerMoney(playerid, - quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) + quantidade);
			SendClientMessage(playerid, COR_AMARELO, "|__Conta Bancária__|");
			format(string, sizeof(string), "Dinheiro depositado: R$%d", quantidade);
		 	SendClientMessage(playerid, COR_VERDE, string);
		 	format(string, sizeof(string), "Saldo Atual no banco: R$%d", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
	    	return 1;
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO2, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COR_AMARELO, "Bancos: Hotel, Car's Shop, Estação ferroviária de San Fierro, San Andreas Federal Mint.");
	    	return 1;
		}
	}

    if(strcmp(cmd, "/sacar", true) == 0) {
        new string[256];
		new tmp[256];
		new quantidade;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_BRANCO, "/sacar [Quantia]");
	    	return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade < 0){
	        SendClientMessage(playerid, COR_VERMELHO, "Banco: Este valor é invalido, verifique o seu saldo, usando /saldo");
	    	return 1;
		}
		if(quantidade > udb_getBankMoney(PlayerName(playerid))){
		    SendClientMessage(playerid, COR_VERMELHO, "Banco: Este valor é invalido, verifique o seu saldo, usando /saldo");
	    	return 1;
		}
	    if(IsPlayerInCheckpoint(playerid)){
			SendClientMessage(playerid, COR_AMARELO, "|___Conta Bancária___|");
	        GivePlayerMoney(playerid, quantidade);
	        udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - quantidade);
			format(string, sizeof(string), "Dinheiro retirado: R$%d", quantidade);
		 	SendClientMessage(playerid, COR_VERDE, string);
		 	format(string, sizeof(string), "Saldo Atual no banco: R$%d", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
	    	return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COR_AMARELO, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
			SendClientMessage(playerid, COR_VERDE, "Dica: $ no mapa é sempre um banco, se não achar contate um administrador.");
			return 1;
		}
	}

    if(strcmp(cmd, "/saldo", true) == 0) {
		new string[256];
        if(IsPlayerInCheckpoint(playerid)){
           	SendClientMessage(playerid, COR_AMARELO, "|___Saldo Bancário___|");
			format(string, sizeof(string), "Saldo: R$%d", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
			SendClientMessage(playerid, COR_AZUL, "Seu extrato foi imprimido com sucesso!");
	    	return 1;
		}
		else{
			SendClientMessage(playerid, COR_AMARELO, "Você precisa estar em um banco para usar esse comando.");
			SendClientMessage(playerid, COR_AMARELO, "Bancos: Hotel, Car's Shop, SF Train Station, San Andreas Federal Mint.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/saldocell", true) == 0) {
		new string[256];
	    if(GetPlayerMoney(playerid) < 5){
            SendClientMessage(playerid, COR_AMARELO, "Você precisa ter R$5,00 para ver seu saldo pelo celular.");
	    	return 1;
		}
		else{
		    GivePlayerMoney(playerid, -5);
			format(string, sizeof(string), "Banco: Seu saldo é de: R$%d.", udb_getBankMoney(PlayerName(playerid)));
			SendClientMessage(playerid, COR_VERDE, string);
			SendClientMessage(playerid, COR_AMARELO, "Obrigado por usar nosso sistema de banco 24horas por celular");
	    	return 1;
		}
	}


    if(strcmp(cmd, "/abastecer", true) == 0) {
		new tmp[256];
		new quantidade;
		new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)){
			SendClientMessage(playerid, COR_VERMELHO, "/abastecer [Litros]");
	     	return 1;
		}
	    quantidade = strval(tmp);
	    if(quantidade <= 0 || GetPlayerMoney(playerid) < quantidade){
	        SendClientMessage(playerid, COR_VERMELHO, "Você não tem dinheiro para pagar a gasolina... isso que é pobreza!");
	    	return 1;
		}
		if(AreaPosto[playerid] == 1){
			if(quantidade + Petrol[playerid] < 100){
			    Petrol[playerid] = Petrol[playerid] + quantidade;
			    format(string, sizeof(string), "Foram colocados %d litros de combustível.", quantidade);
				SendClientMessage(playerid, COR_VERDE, string);
				GivePlayerMoney(playerid, - quantidade);
				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
		    	return 1;
			}
			if(quantidade + Petrol[playerid] >= 100){
			    new quantia;
			    quantia = 100 - Petrol[playerid];
			    Petrol[playerid] = 100;
                format(string, sizeof(string), "Seu tanque está cheio, ou seja tem %d litros nele.", quantia);
				SendClientMessage(playerid, COR_VERDE, string);
				GivePlayerMoney(playerid, - quantia);
				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
		    	return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Você não está no posto de gasolina, consulte o administrador para saber onde fica.");
	    	return 1;
		}
	}

    if(strcmp(cmd, "/vcolete", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vcolete [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu um colete para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu um colete!");
			    	SetPlayerArmour(plid, 100);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vfaca", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vfaca [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma faca!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma faca!");
			    	GivePlayerWeapon(plid,4,1);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vm4", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vm4 [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(plid,31,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vak47", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vak47 [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(plid,30,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vshotgun", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vshotgun [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(plid,34,50);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vmp5", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
            if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vmp5 [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
	    	    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(plid,29,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vsdpistol", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vsdpistol [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma pistola silenciosa para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma pistola silenciosa!");
			    	GivePlayerWeapon(plid,23,500);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vswanoff", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vswanoff [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma Sawn Off para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma Swan Off!");
			    	GivePlayerWeapon(plid,26,800);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vdildo", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vdildo [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu um vibrador para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu um vibrador!");
			    	GivePlayerWeapon(plid,13,0);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd, "/vdeserteagle", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
            if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/deserteagle [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma desert eagle para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma desert eagle!");
			    	GivePlayerWeapon(plid,24,500);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd, "/vsniper", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vsniper [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(plid,34,50);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd, "/vtec9", true) == 0) {
	    if(IsPlayerAdmin(playerid) || Profissao[playerid] == VENDEDOR_DE_ARMAS) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/vtec9 [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
        	   } else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 21){
			    	SendClientMessage(playerid, COR_VERDE, "Você vendeu uma sniper para alguém!");
			    	SendClientMessage(plid, COR_BRANCO, "Um vendedor de armas lhe vendeu uma sniper!");
			    	GivePlayerWeapon(plid,32,750);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para vender a arma!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas vendedores de armas podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/pagar", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new pagamento;
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pagar [ID] [Quantia]");
	    	return 1;
		}
		plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pagar [ID] [Quantia]");
	    	return 1;
		}
 		pagamento = strval(tmp);
        if(Profissao[plid] == VENDEDOR_DE_CARROS || Profissao[plid] == CORRETOR || Profissao[plid] == BDR || IsPlayerAdmin(playerid)){
 	    	if(pagamento > GetPlayerMoney(plid) || pagamento <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "Você não tem essa quantia!");
		    	return 1;
			}
 			if(IsPlayerConnected(plid)){
 			    new lucros;
				lucros = pagamento + pagamento/10;
 			    GivePlayerMoney(plid, lucros);
 			    GivePlayerMoney(playerid, 0-pagamento);
    	        SendClientMessage(playerid, COR_VERDE, "Pagamento feito.");
				format(string, sizeof(string), "Você vendeu por %d e lucrou %d com a venda", pagamento, pagamento/10);
				SendClientMessage(playerid, COR_VERDE, string);
		    	return 1;
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
		    	return 1;
			}
		}
		if(Profissao[plid] != VENDEDOR_DE_CARROS || Profissao[plid] != CORRETOR){
		    SendClientMessage(playerid, COR_VERMELHO, "Você está tentando pagar alguem que não é coretor e nem vendedor!");
	    	return 1;
		}
	}


    if(strcmp(cmdtext, "/kill", true) == 0) {
		   SendClientMessage(playerid, COR_VERMELHO, "Erro: /kill não é o comando para se suicidar /morrer sim é o correto");
		   return 1;
       }
    if(strcmp(cmdtext, "/suicidio", true) == 0) {
		   SendClientMessage(playerid, COR_VERMELHO, "Erro: O comando para se suicidar é /morrer");
		   return 1;
       }
    if(strcmp(cmdtext, "/suicidarse", true) == 0) {
		   SendClientMessage(playerid, COR_VERMELHO, "Erro: O comando para se suicidar é /morrer");
		   return 1;
       }

	if(strcmp(cmdtext, "/morrer", true) == 0){
		   SendClientMessage(playerid, COR_VERMELHO, "Você aceita morrer??");
	       SendClientMessage(playerid, COR_VERMELHO, "Para morrer use, /aceito");
	       SendClientMessage(playerid, COR_VERDE, "Ou use, /cancelar para cancelar a morte");
	       return 1;
	   }
    if(strcmp(cmd, "/aceito", true) == 0){
		   SendClientMessage(playerid, COR_VERMELHO, "Feito!");
		   SetPlayerHealth(playerid, 0.0);
	       return 1;
	   }
    if(strcmp(cmdtext, "/cancelar", true) == 0){
		   SendClientMessage(playerid, COR_VERDE, "Tudo bem quando quiser se matar repita a operação!");
		   return 1;
	   }

	if(strcmp(cmd, "/mostrardocs", true) == 0 || strcmp(cmd, "/ci", true) == 0 || strcmp(cmd, "/documentos", true) == 0) {
		new string[256];
	    new tmp[256];
	    new plid;
	    new hab[3];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "Seus documentos foram mostrados.");
	    	return 1;
		}
        plid = strval(tmp);
		if(IsPlayerConnected(plid)){
		    hab[2] = udb_getHabaerea(PlayerName(playerid));
		    hab[0] = udb_gethabterre(PlayerName(playerid));
		    hab[1] = udb_getHabnauti(PlayerName(playerid));
			format(string, sizeof(string), "Carteira de Habilitações de: %s", PlayerName(playerid));
			SendClientMessage(plid, COR_AMARELO, string);
			format(string, sizeof(string), "Este player usa skin numero: %d", udb_getSkin(PlayerName(playerid)));
			SendClientMessage(plid, COR_AMARELO, string);
			if(hab[0] == 0){
			    SendClientMessage(plid, COR_AMARELO, "Habilitação de Carros e Motos: Não");
			}
			if(hab[0] == 1){
			    SendClientMessage(plid, COR_AMARELO, "Habilitação de Carros e Motos: Sim");
			}
			if(hab[1] == 0){
			    SendClientMessage(plid, COR_AMARELO, "Habilitação Náutica: Não");
			}
			if(hab[1] == 1){
			    SendClientMessage(plid, COR_AMARELO, "Habilitação Náutica: Sim");
			}
			if(hab[2] == 0){
			    SendClientMessage(plid, COR_AMARELO, "Habilitação Aérea: Não");
			}
			if(hab[2] == 1){
			    SendClientMessage(plid, COR_AMARELO, "Habilitação Aérea: Sim");
			}
			format(string, sizeof(string), "Documentos mostrados para %s.", PlayerName(plid));
			SendClientMessage(playerid, COR_AMARELO, string);
	    	return 1;
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Este jogador não está online");
		}
	}
	if(strcmp(cmd, "/compraraerea", true) == 0){
		   SendClientMessage(playerid, COR_VERMELHO, "Você acaba de comprar uma licensa aérea");
		   udb_setHabaerea(PlayerName(playerid), 1);
		   GivePlayerMoney(playerid, -25000);
		   udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) -25000);
	       return 1;
	   }
	if(strcmp(cmd, "/comprarterrestre", true) == 0){
		   SendClientMessage(playerid, COR_VERMELHO, "Você acaba de comprar uma licensa para dirigir veículos terrestres");
		   udb_setHabterre(PlayerName(playerid), 1);
		   GivePlayerMoney(playerid, -12000);
		   udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) -12000);
	       return 1;
	   }
   	if(strcmp(cmd, "/comprarnautica", true) == 0){
		   SendClientMessage(playerid, COR_VERMELHO, "Você acaba de comprar uma licensa náutica");
		   udb_setHabnauti(PlayerName(playerid), 1);
		   GivePlayerMoney(playerid, -20000);
		   udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) -20000);
	       return 1;
	   }
	if(strcmp(cmd, "/habaerea", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERDE, "Habilitação da Força Aérea de SA Concedida.");
		    	return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação da Força Aérea de SA Concedida.");
			    SendClientMessage(plid, COR_VERDE, "Você recebeu habilitação da Força Aérea de San Andreas®.");
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem nível suficiente.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/habterrestre", true) == 0) {
	    if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERDE, "Habilitação de carros e motos do Detran de SA Concedida.");
		    	return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação de carros e motos do Detran de SA Concedida.");
			    SendClientMessage(plid, COR_VERDE, "Você recebeu uma habilitação de carros e motos do Detran de SA®.");
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não pode executar este comando.");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/habnautica", true) == 0) {
		if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERDE, "Você concedeu uma habilitação náutica!");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 1);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação Náutica da marinha de SA Concedida.");
			    SendClientMessage(plid, COR_VERDE, "Você acaba de receber Habilitação Náutica.");
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
		    	return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não pode executar este comando.");
	    	return 1;
		}
	}


    if(strcmp(cmd, "/puniraerea", true) == 0) {
	    if(Profissao[playerid] == BDR || Profissao[playerid] == FISCAL_DETRAN || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/puniraerea [ID]");
				return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabaerea(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação aérea Retirado com sucesso!");
			    SendClientMessage(plid, COR_VERMELHO, "Você perdeu a sua habilitação aérea.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}
	if(strcmp(cmd, "/punirterrestre", true) == 0) {
	    if(Profissao[playerid] == BDR || Profissao[playerid] == FISCAL_DETRAN || IsPlayerAdmin(playerid)){
			new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/punirterrestre [id]");
				return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabterre(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação terrestre do Detran retirada com sucesso.");
			    SendClientMessage(plid, COR_VERMELHO, "Você perdeu a sua habilitação terrestre.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}

	if(strcmp(cmd, "/punirnautica", true) == 0) {
		if(Profissao[playerid] == BDR || Profissao[playerid] == FISCAL_DETRAN || IsPlayerAdmin(playerid)){
			new tmp[256];
			new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/punirnautica [ID]");
			return 1;
			}
    	    plid = strval(tmp);
			if(IsPlayerConnected(plid)){
			    udb_setHabnauti(PlayerName(plid), 0);
			    SendClientMessage(playerid, COR_VERDE, "Habilitação náutica Retirada com sucesso.");
			    SendClientMessage(plid, COR_VERMELHO, "Você perdeu a sua habilitação náutica.");
				return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "ID inválido");
				return 1;
			}
		}
        if(Profissao[playerid] != INSTRUTOR_DE_DIRECAO){
            SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
			return 1;
		}
	}
	if(strcmp(cmd, "/prender", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/prender [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			    	format(string, sizeof(string), "Você prendeu %s", PlayerName(plid));
					SendClientMessage(playerid, COR_VERMELHO, string);
			    	Presos[plid] = 1;
				    udb_setPrisao(PlayerName(plid), 1);
					LogarPlayer(plid);
					format(string, sizeof(string), "Você foi preso por %s", PlayerName(playerid));
					SendClientMessage(plid, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para prender!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/algemar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/algemar [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			    	format(string, sizeof(string), "Você algemou %s", PlayerName(plid));
					SendClientMessage(playerid, COR_VERDE, string);
			    	TogglePlayerControllable(plid, 0);
					format(string, sizeof(string), "Você foi algemado por %s", PlayerName(playerid));
					SendClientMessage(plid, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para algemar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd,"/tiraralgemas",true)==0){
        if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/tiraralgemas [ID]");
				return 1;
		    	}

  	        plid = strval(tmp);
            format(string, sizeof(string), "Você tirou as algemas de %s", PlayerName(plid));
			SendClientMessage(playerid, COR_VERDE, string);
            SendClientMessage(plid, COR_VERDE, "Você está livre, as algemas foram tiradas!");
            TogglePlayerControllable(plid,1);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd,"/fuder",true)==0){
        if(IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/fuder [ID]");
				return 1;
		    	}

  	        plid = strval(tmp);
            format(string, sizeof(string), "O jogador %s foi fudido!!", PlayerName(plid));
			SendClientMessage(playerid, COR_VERDE, string);
            SendClientMessage(plid, COR_VERDE, "Kkkkkkkkkk o ADM fudeu você!!!");
            ResetPlayerWeapons(plid);
            GivePlayerWeapon(plid,10,0);
            SetPlayerHealth(plid, 20);
            SetPlayerArmour(plid, 0);
            SetPlayerScore(plid, 0);
            ResetPlayerMoney(plid);
            SetPlayerName(plid,"SOU_1_GAY_FUDIDO");
            SetPlayerSkin(plid, 246);
            SetPlayerWantedLevel(plid, 6);
            if (IsPlayerInAnyVehicle(plid))
            {
            RemovePlayerFromVehicle(plid);
            }
			return 1;
		}
		return 1;
	}
    if(strcmp(cmd, "/fianca", true) == 0) {
        if(Presos[playerid] == 0){
            SendClientMessage(playerid,COR_VERMELHO,"Você não está preso!");
	    	return 1;
		} else {
		    if(udb_getBankMoney(PlayerName(playerid)) < 15000){
		        SendClientMessage(playerid,COR_VERMELHO,"Você não tem toda essa quantia no banco!");
		        return 1;
		    } else {
				udb_setPrisao(PlayerName(playerid), 0);
				Presos[playerid] = 0;
				SetSpawnInfo(playerid,1,udb_getSkin(PlayerName(playerid)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
				SpawnPlayer(playerid);
				SendClientMessage(playerid, COR_VERDE, "Você pagou a fiança no valor de R$15000 e foi solto.");
				udb_setBankMoney(PlayerName(playerid), udb_getBankMoney(PlayerName(playerid)) - 1500);
		    	return 1;
			}
		}
	}
	if(strcmp(cmd, "/soltar", true) == 0) {
	    if(Profissao[playerid] == JUIZ || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_ELITE || IsPlayerAdmin(playerid)|| Profissao[playerid] == REI_DO_CRIME ||Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/soltar [ID]");
		    	return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				if(Presos[plid] == 0){
				    SendClientMessage(playerid,COR_VERMELHO,"O jogador não está preso!");
			    	return 1;
				} else {
				    udb_setPrisao(PlayerName(playerid), 0);
					Presos[plid] = 0;
				    SetSpawnInfo(plid,0,udb_getSkin(PlayerName(plid)),-1605.4003,717.6241,11.9564,0,0,0,0,0,0,0);
				    SpawnPlayer(plid);
					SendClientMessage(plid,COR_VERDE,"Você foi solto, mas se cometer mais crimes, pagará a pena novamente.");
				    format(tmp,sizeof(tmp),"Você foi solto por %s",PlayerName(playerid));
				    SendClientMessage(plid,COR_VERDE,tmp);
				    format(tmp,sizeof(tmp),"Você soltou %s da cadeia!",PlayerName(plid));
				    SendClientMessage(playerid,COR_VERDE,tmp);
			    	return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
			    return 1;
			}
		}
		if(Profissao[playerid] != JUIZ || Profissao[playerid] != COP_ELITE){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não é um autoridade");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/setprof", true) == 0 || strcmp(cmd, "/emprego", true) == 0 || strcmp(cmd, "/trampar", true) == 0 || strcmp(cmd, "/darprof", true) == 0 || strcmp(cmd, "/daremprego", true) == 0 || strcmp(cmd, "/empregar", true) == 0 && IsPlayerConnected(playerid)) {
	if(IsPlayerAdmin(playerid) == 1 ||Profissao[playerid] == BDR ) {
	    new tmp[256];
	    new plid;
	    new prof;
	    new string[256];
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
	    	SendClientMessage(playerid, COR_VERMELHO, "/setprof [ID] [ID da prof]");
	    	return 1;
		}
        plid = strval(tmp);
		tmp = strtok(cmdtext, idx);
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/setprof [ID] [ID da prof]");
	    	return 1;
		}
        prof = strval(tmp);
        if(IsPlayerConnected(plid)){
            if(prof > 0 && prof < 65){
				udb_setProf(PlayerName(plid), prof);
				format(string, sizeof(string), "Você mudou a profissão de %s para %d", PlayerName(plid), prof);
				SendClientMessage(playerid, COR_VERDE, string);
				SendClientMessage(plid, COR_VERDE, "Você mudou de profissão, digite /profissao para ver os comandos.");
				Profissao[plid] = prof;
				LogarPlayer(plid);
		    	return 1;
			}
			if(IsPlayerInAnyVehicle(plid))
	        {
		        {
		    SendClientMessage(playerid, COR_VERMELHO,"Você não pode dar profissão a este jogador, ele está em um veículo!");
		    return 0;
		        }
	        }
		    else{
			    SendClientMessage(playerid, COR_VERMELHO, "Essa não é uma profisssão válida!");
		    	return 1;
			}
		}
		else{
		    SendClientMessage(playerid, COR_VERMELHO, "Jogador não está conectado/logado");
		    return 1;
		}
	}
	else
	{
	    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso!");
	    return 1;
	    }
	}
	if(strcmp(cmd,"/discursar",true)==0){
	    if(Profissao[playerid] == DEPUTADO || Profissao[playerid] == BDR ||Profissao[playerid] == PRESIDENTE || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,10,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/discursar [texto]");
		    	return 1;
			} else {
			    format(msg,sizeof(msg),"O Jogador %s faz um discurso:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,msg);
			    SendClientMessageToAll(COR_BRANCO,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}

    if(strcmp(cmd,"/casar",true)==0){
	    if(Profissao[playerid] == PADRE ||Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,6,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/casar [Casal]");
		    	return 1;
			} else {
			    format(msg,sizeof(msg),"O padre %s Casou:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,msg);
			    SendClientMessageToAll(COR_BRANCO,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
    if(strcmp(cmd,"/rimar",true)==0){
	    if(Profissao[playerid] == RAPPER || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,6,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/rimar [Rima]");
		    	return 1;
			} else {
			    format(msg,sizeof(msg),"O Rapper %s Fez uma rima:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,msg);
			    SendClientMessageToAll(COR_BRANCO,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você é Rapper? não? ENTÃO VC NUM PODE USAR ESTE COMANDO CARAMBA!!");
	    	return 1;
		}
	}

	if(strcmp(cmd,"/publicar",true)==0){
	    if(Profissao[playerid] == GOVERNADOR || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,9,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/publicar [Texto]");
		    	return 1;
			} else {
			    format(msg,sizeof(msg),"Governo Estadual, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COR_AMARELO,msg);
			    SendClientMessageToAll(COR_BRANCO,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	if(strcmp(cmd,"/noticia",true)==0){
	    if(Profissao[playerid] == JORNALISTA || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	    	new tmp[256];
	    	new msg[256];
	    	strmid(tmp,cmdtext,8,strlen(cmdtext));
	    	if(!strlen(tmp)) {
	        	SendClientMessage(playerid,COR_VERMELHO,"/noticia [texto]");
		    	return 1;
			} else {
			    format(msg,sizeof(msg),"[BDR]News, %s informa:",PlayerName(playerid));
			    SendClientMessageToAll(COR_VERMELHO,msg);
			    SendClientMessageToAll(COR_AZUL,tmp);
		    	return 1;
			}
		}else{
		    SendClientMessage(playerid,COR_VERMELHO,"Você precisa ser jornalista para usar este comando!");
	    	return 1;
		}
	}
	if (strcmp(cmd, "/pt", true)==0){
		new tmp[256];
		new string[256];
	    strmid(tmp, cmdtext, 3, strlen(cmdtext));
		if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/pt [Texto]");
	    	return 1;
		}
		else{
		    for(new i=0; i<MAX_PLAYERS; i++){
		        if(Profissao[i] == Profissao[playerid]){
					format(string, sizeof(string), "%s Diz: %s", PlayerName(playerid), tmp);
					SendClientMessage(i, GetPlayerColor(playerid), string);
					SendClientMessage(playerid, GetPlayerColor(playerid), string);
					return 1;
			 	}
			}
		}
	}

	if (strcmp(cmdtext, "/profissao", true)==0){
	    if(Profissao[playerid] == AGRICULTOR) {
            SendClientMessage(playerid, COR_VERDE, "Agricultor - Comandos:");
            SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/plantarmilho: Planta milho na área da fazenda");
			SendClientMessage(playerid, COR_AMARELO, "/vendermilho: O milho depois de plantado e colhido você pode vende-lo");
            }
	      else if(Profissao[playerid] == TRAFICANTE) {
	        SendClientMessage(playerid, COR_VERDE, "Traficante - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/vcocaina [ID] [quantidade] : Vende cocaína para um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vheroina [ID] [quantidade] : Aplica uma injeção de heroína em um jogador.");
            SendClientMessage(playerid, COR_AMARELO, "/vmaconha [ID] [quantidade] : Vende maconha para um jogador.");
            SendClientMessage(playerid, COR_AMARELO, "/vcrack   [ID] [quantidade] : Vende pedras de crack para um jogador.");
	    }
	      else if(Profissao[playerid] == FISCAL_DETRAN) {
	        SendClientMessage(playerid, COR_VERDE, "Fiscal do Detran - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/punirterrestre [ID]: Tira habilitação terrestre de alguem.");
	        SendClientMessage(playerid, COR_AMARELO, "/punirnautica: Tira habilitação nautica de alguem.");
	        SendClientMessage(playerid, COR_AMARELO, "/puniraerea: Tira habilitação aérea de alguem.");
	        SendClientMessage(playerid, COR_AZUL, "Escolha alguém para você fazer teste de direção se for resprovado tire a carteira dele");
	    }
          else if(Profissao[playerid] == VENDEDOR_DE_ARMAS) {
			SendClientMessage(playerid, COR_VERDE, "Vendedor de Armas - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [Texto]: Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/vsdpistol: vende uma 9mm silenciosa para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vdeserteagle: vende uma desert eagle para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vsniper: vende uma sniper para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vtec9: vende uma tec9 para alguem.");
			SendClientMessage(playerid, COR_AMARELO, "/vshotgun: vende uma shotgun para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vak47: vende uma ak47 para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vm4: vende uma m4 para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vmp5: vende uma mp5 para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vfaca: vende uma faca para alguem.");
            SendClientMessage(playerid, COR_AMARELO, "/vswanoff: Vende uma Swan Off para alguem");
            SendClientMessage(playerid, COR_AMARELO, "/vdildo: Vende um vibrador para alguem");
            SendClientMessage(playerid, COR_AMARELO, "/vcolete: vende um colete para alguem.");
			SendClientMessage(playerid, COR_AMARELO, "Armas - LTDA");
		}
          else if(Profissao[playerid] == VIDA_LOKA) {
	        SendClientMessage(playerid, COR_VERDE, "Vida Loka - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/avl : Abre o portão da Vida Loka /fvl : Fecha portão da Vida Loka");
			SendClientMessage(playerid, COR_AMARELO, "/acvl: abre a casa da Vida Loka /fcvl: fexa a casa da Vida Loka");
			SendClientMessage(playerid, COR_VL, "VIDA LOKA!!");
	    }
		  else if(Profissao[playerid] == GANG_RIFA) {
	        SendClientMessage(playerid, COR_VERDE, "Membro de Gangue - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/roubar [ID]: Rouba alguem que estiver online (precisa estar perto).");
	        SendClientMessage(playerid, COR_AMARELO, "Roube e depois divida com os outros membros de gangue e divida a parte do chefe");
	    }
	      else if(Profissao[playerid] == DETETIVE) {
	        SendClientMessage(playerid, COR_VERDE, "Detetive - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
	    }
	      else if(Profissao[playerid] == SWAT) {
	        SendClientMessage(playerid, COR_VERDE, "SWAT - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
	    }
          else if(Profissao[playerid] == COP_MILITAR) {
	        SendClientMessage(playerid, COR_VERDE, "Policial Militar - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
        }
	      else if(Profissao[playerid] == KGB) {
	        SendClientMessage(playerid, COR_VERDE, "KGB - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
	    }
		  else if(Profissao[playerid] == ASSALTANTE) {
	        SendClientMessage(playerid, COR_VERDE, "Assaltante - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_AMARELO, "/roubar [ID]: Rouba uma pessoa");
			SendClientMessage(playerid, COR_AMARELO, "/assaltarbanco: Assalta um banco e recebe $1500");
	    }
		  else if(Profissao[playerid] == ADVOGADO) {
	        SendClientMessage(playerid, COR_VERDE, "Advogado - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VERDE, "/processo: Inicia um processo para pedir um abeas corpos e defender alguem");
	    }
		  else if(Profissao[playerid] == DEPUTADO) {
	        SendClientMessage(playerid, COR_VERDE, "Deputado - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/discursar para você falar se você contrata homens para trablhar com você!");
         }
          else if(Profissao[playerid] == BOXE) {
	        SendClientMessage(playerid, COR_VERDE, "Lutador de Boxe - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_VERDE, "Bem não tem comando por que a luta tem que ser pra valer... matar alguem no soco.");
         }
          else if(Profissao[playerid] == COMERCIO) {
	        SendClientMessage(playerid, COR_VERDE, "Comerciante do Camlódromo - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_VERDE, "Sua profissão não tem comandos por que como você venderia um DVD Pirata pra alguem? o.O");
         }
          else if(Profissao[playerid] == MOTORISTA_TREM) {
	        SendClientMessage(playerid, COR_VERDE, "Motorista de Trem - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_VERDE, "Pegue seu trenzinho e vá levando as pessoas pra onde kiserem mas... COBRE GRANA!!!!");
         }
          else if(Profissao[playerid] == CIA) {
	        SendClientMessage(playerid, COR_VERDE, "Agente da CIA - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		  else if(Profissao[playerid] == BOMBEIRO) {
	        SendClientMessage(playerid, COR_VERDE, "Bombeiro - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_VERDE, "Simples se sabe o q fazer eh soh apagar o fogo =D");
         }
          else if(Profissao[playerid] == MARINHA) {
	        SendClientMessage(playerid, COR_VERDE, "Marinha - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/am: Abre o portão do Exercito e Marinha /fm: Fecha o portão do Exercito e Marinha");
         }
          else if(Profissao[playerid] == RAPPER) {
	        SendClientMessage(playerid, COR_VERDE, "Rapper - Comandos:");
	        SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
	        SendClientMessage(playerid, COR_AMARELO, "/rimar: Faz uma rima para todos ouvirem");
         }
		  else if(Profissao[playerid] == GOVERNADOR) {
		    SendClientMessage(playerid, COR_VERDE, "Governador - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/publicar [texto] : faz um discurso!!!.");
		}
		  else if(Profissao[playerid] == TUNADOR) {
		    SendClientMessage(playerid, COR_VERDE, "Tunador/Mecanico - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/tunarcarro: para tunar um carro cobre do jogador 3500 senão vc irá se ferrar!");
		    SendClientMessage(playerid, COR_AMARELO, "/reparar: para reparar um veiculo!");
            SendClientMessage(playerid, COR_AMARELO, "/pintar: Pinta um carro [cor1] e [cor2]");
		}
		  else if(Profissao[playerid] == JORNALISTA) {
		    SendClientMessage(playerid, COR_VERDE, "Jornalista - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/noticia [texto] : Publica uma notícia.");
		}
          else if(Profissao[playerid] == FRENTISTA) {
		    SendClientMessage(playerid, COR_VERDE, "Frentista - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/vender [ID][Quantidade]: Dá combustivel para algum player.");
		}
		  else if(Profissao[playerid] == PARAMEDICO) {
		    SendClientMessage(playerid, COR_VERDE, "Paramédico - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/curativo [id] : Enche a barra de saúde (health) de alguém.");
		}
		  else if(Profissao[playerid] == TAXISTA) {
			SendClientMessage(playerid, COR_VERDE, "Taxista - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/ttaxi [id] : Começa a rodar o taxímetro (o passageiro tem que estar no seu carro).");
		}
          else if(Profissao[playerid] == HOMEM_BOMBA) {
			SendClientMessage(playerid, COR_VERDE, "Homem Bomba - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/plantarbomba: Planta uma bomba no local onde vc estiver mas depois disso CORRA!!");
		}
		  else if(Profissao[playerid] == REI_DO_CRIME) {
			SendClientMessage(playerid, COR_VERDE, "Rei do Crime - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/vcocaina [id] [quantidade] : Vende cocaína para um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vheroina [id] [quantidade] : Aplica uma injeção de heroína em um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vmaconha [id] [quantidade] : Vende maconha para um jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/assaltarbanco: Assalta um banco");
			SendClientMessage(playerid, COR_AMARELO, "/roubar [ID]: Rouba alguem");
			SendClientMessage(playerid, COR_AMARELO, "/gangue [COMANDO]: Faz com que traficantes,Matador de Alguel e Assaltantes sejam informados.");
		}
		  else if(Profissao[playerid] == TAXISTA_AEREO){
		    SendClientMessage(playerid, COR_VERDE, "Taxista Aéreo - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/ataxi [id] : Começa a rodar o taxímetro aéreo (o passageiro tem que estar no seu veículo);");
		}
          else if(Profissao[playerid] == PADRE){
		    SendClientMessage(playerid, COR_VERDE, "Padre - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/casar [id] : Casa 2 pessoas exemplo: /casar Joao e Maria");
		}
		  else if(Profissao[playerid] == MOTOBOY){
		    SendClientMessage(playerid, COR_VERDE, "Moto Boy - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/mtaxi [id] : Começa a rodar o moto-taxímetro (o passageiro tem que estar em sua moto.");
		}
		  else if(Profissao[playerid] == ENTREGADOR_PIZZA){
		    SendClientMessage(playerid, COR_VERDE, "Entregador de Pizza - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
		    SendClientMessage(playerid, COR_AMARELO, "/entregarpizza [id] : Vende uma pizza para alguém.");
		}
		  else if(Profissao[playerid] == VENDEDOR_DE_CARROS) {
			SendClientMessage(playerid, COR_VERDE, "Vendedor de Carros - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/setcar [ID do veículo] [nick-lugar] [cor1] [cor2] : Vende um carro (esteja com ele na posição de spawn).");
			SendClientMessage(playerid, COR_AMARELO, "/criarveiculo [ID do veículo]: Cria um veículo do ID desejado.");
            SendClientMessage(playerid, COR_AMARELO, "/precos: Para saber a lista oficial de preços do [BDR]RPG Rules");
		}
		  else if(Profissao[playerid] == CORRETOR) {
			SendClientMessage(playerid, COR_VERDE, "Corretor de Imóveis - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/casa [Nick] : Seta a casa para alguem, (esteja na posiçao exterior à casa).");
		}
		  else if(Profissao[playerid] == BARMAN) {
			SendClientMessage(playerid, COR_VERDE, "Barman - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_AMARELO, "/vskol [id] [teor] : Vende uma Skol em lata e adiciona o teor alcolico no sangue do loquinho");
            SendClientMessage(playerid, COR_AMARELO, "/vice [id] [teor] : Vende uma ICE em garrafa e adiciona o teor de alcool no sangue da pessoa");
            SendClientMessage(playerid, COR_AMARELO, "/vpinga [id] [teor] : Vende uma Pinga em garrafa de vidro para alguem e adiciona o teor de alcol no sangue do cara");
			SendClientMessage(playerid, COR_AMARELO, "/drink [id] [teor] : Vende uma bebida alcoolica e adiciona o teor de alcool no sangue da pessoa");
		}
		  else if(Profissao[playerid] == HOT_DOG) {
			SendClientMessage(playerid, COR_VERDE, "Vendedor de Hot Dog - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/vhotdog [id] : Vende um hot dog para alguém");
		}
		  else if(Profissao[playerid] == SORVETEIRO) {
			SendClientMessage(playerid, COR_VERDE, "Vendedor de Sorvete - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/vsorvete [id] : Vende um sorvete para alguém");
		}
		  else if(Profissao[playerid] == JUIZ) {
			SendClientMessage(playerid, COR_VERDE, "Juiz - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [id] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
		}
		  else if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_RODOVIARIO) {
			SendClientMessage(playerid, COR_VERDE, "Polícia Rodoviária/Civil - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		  else if(Profissao[playerid] == COP_ELITE) {
			SendClientMessage(playerid, COR_VERDE, "BOPE - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
          else if(Profissao[playerid] == FBI) {
			SendClientMessage(playerid, COR_VERDE, "Agente do FBI - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
		}
		  else if(Profissao[playerid] == INSTRUTOR_DE_DIRECAO) {
			SendClientMessage(playerid, COR_VERDE, "Instrutor de direção - Comandos");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/habaerea : Habilita uma pessoa a dirigir veículos aereos (aviões e helicopteros).");
			SendClientMessage(playerid, COR_AMARELO, "/habterrestre : Habilita uma pessoa a dirigir veículos terrestres (carros e motos).");
			SendClientMessage(playerid, COR_AMARELO, "/precos: Para ver a lista oficial de preços do [BDR]RPG Rules");
            SendClientMessage(playerid, COR_AMARELO, "/precoshab: para ver somente a lista de habilitações");
			SendClientMessage(playerid, COR_AMARELO, "/habnautica : Dá a alguem uma habilitação náutica.");
		}
		  else if(Profissao[playerid] == PESCADOR) {
		    SendClientMessage(playerid, COR_AMARELO, "Pescador - Comandos");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/pescar : Joga a VERMELHOe para pesca, para isso é preciso estar na área de pesca.");
		    SendClientMessage(playerid, COR_AMARELO, "/vendepesca : Vende todas as suas pescas acumuladas, é preciso estar na cooperativa de pesca.");
		    SendClientMessage(playerid, COR_AMARELO, "Se você vender sua pesca como pescador, ganhará $30 de lucro em cada pesca.");
		}
		  else if(Profissao[playerid] == NARCOTICOS) {
		    SendClientMessage(playerid, COR_AMARELO, "Narcóticos - Comandos:");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO,"/examead [id] : Realiza o exame anti-dopping para verificar a presença de entorpecentes no sangue");
		    SendClientMessage(playerid, COR_AMARELO,"de uma pessoa.");
		    SendClientMessage(playerid, COR_AMARELO,"/prender [id] : Prende uma pessoa.");
		}
		  else if(Profissao[playerid] == CAMINHONEIRO) {
			SendClientMessage(playerid, COR_VERDE, "Caminhoneiro - Comandos:");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
		    SendClientMessage(playerid, COR_AMARELO, "/carregar : Carregar o veículo que está carregando (é preciso estar na área de carga).");
			SendClientMessage(playerid, COR_AMARELO, "/descarregar : Descarrega seu veículo (é preciso estar na área de descarga).");
		}
		  else if(Profissao[playerid] == PRESIDENTE) {
		    SendClientMessage(playerid, COR_VERDE, "Presidente - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/discurasar: Faz um breve discurso do que voce quiser");
			}
          else if(Profissao[playerid] == LADRAO_CARROS) {
            SendClientMessage(playerid, COR_VERDE, "Ladrão de carros - Comandos:");
            SendClientMessage(playerid, COR_AMARELO, "/pt [texto : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_AMARELO, "/setcar [id-do-carro] [nick-lugar] [cor1] [cor2] : Vende um carro Roubado (um carro roubado nao pode ser vendido por mais de 10k).");
		}
          else if(Profissao[playerid] == PREFEITO) {
		    SendClientMessage(playerid, COR_VERDE, "Prefeito - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissao que você");
			SendClientMessage(playerid, COR_AZUL, "O prefeito pode apenas participar de eleicoes para Presidente.");
			}
		  else if(Profissao[playerid] == BDR) {
		    SendClientMessage(playerid, COR_VERDE, "[BDR]Game Master - Comandos:");
		    SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
            SendClientMessage(playerid, COR_AMARELO, "/admincomandos e /admincomandos2: Mostra os comandos de admin!");
			}

          else if(Profissao[playerid] == EXERCITO) {
            SendClientMessage(playerid, COR_VERDE, "Exercito - Comandos.");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
			}
          else if(Profissao[playerid] == CHERIFE) {
            SendClientMessage(playerid, COR_VERDE, "Cherife - Comandos.");
			SendClientMessage(playerid, COR_AMARELO, "/pt [texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_AMARELO, "/prender [ID] : Prende uma pessoa na cadeia para aguardar julgamento.");
			SendClientMessage(playerid, COR_AMARELO, "/soltar [id] : Solta uma pessoa da cadeia.");
			SendClientMessage(playerid, COR_AMARELO, "/procurar [id] : Coloca o ID na lista de procurados da policia.");
			SendClientMessage(playerid, COR_AMARELO, "/desprocurar [id] : Retira o ID da lista de procurados da policia.");
            SendClientMessage(playerid, COR_AMARELO, "/ad: abre portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/fd: Fecha portão da delegacia.");
            SendClientMessage(playerid, COR_AMARELO, "/desarmar: Retira as armas de algum jogador.");
			SendClientMessage(playerid, COR_AMARELO, "/algemar: Algema alguém, /tiraralgemas: Tira as algemas de alguém");
			SendClientMessage(playerid, COR_AMARELO, "/multar [id] [quantidade] : Multar uma pessoa.");
			}
          else if(Profissao[playerid] == FOTOGRAFO) {
            SendClientMessage(playerid, COR_VERDE, "Fotografo - Comandos.");
            SendClientMessage(playerid, COR_AMARELO, "/pt [texto]: Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
            SendClientMessage(playerid, COR_AMARELO, "/revelar: Para revelar as fotos que voce tirou");
			}
          else if(Profissao[playerid] == HOTELEIRO) {
            SendClientMessage(playerid, COR_VERDE, "Hoteleiro - Comandos.");
            SendClientMessage(playerid, COR_AMARELO, "/pt [texto]: Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
            SendClientMessage(playerid, COR_AMARELO, "/hospedar [Nick]: Hospeda alguem no hotel de sua preferencia! ");
			}
		  else if(Profissao[playerid] == COP_CORRUPTO) {
            SendClientMessage(playerid, COR_VERDE, "Policial Corrupto - Comandos.");
            SendClientMessage(playerid, COR_AMARELO, "/pt [Texto]: Manda uma mensagem para todas as pessoas que têm a mesma profissão que você.");
            SendClientMessage(playerid, COR_AMARELO, "/vcocaina [ID] [quantidade] : Vende cocaína para um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vheroina [ID] [quantidade] : Aplica uma injeção de heroína em um jogador.");
	        SendClientMessage(playerid, COR_AMARELO, "/vmaconha [ID] [quantidade] : Vende maconha para um jogador.");
			}
		  else{
			SendClientMessage(playerid, COR_VERDE, "Desempregado - Recém Chegado");
			SendClientMessage(playerid, COR_AMARELO, "/pt [Texto] : Manda uma mensagem para todas as pessoas que têm a mesma profissão que você");
			SendClientMessage(playerid, COR_VERDE, "Sua profissão não tem nenhum comando especial!");
			return 0;
        }
	}

	if (strcmp(cmdtext, "/presos", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_AMARELO, "|_______PROCURADOS_DO_[BDR]RPG_RULES_BRASIL™______|");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Presos[i] == 1){
				format(string, sizeof(string), "Nome: %s (ID: %d)",PlayerName(i), i);
				SendClientMessage(i, COR_AZULPLUS, string);
				SendClientMessage(i, COR_VERMELHO, "Por favor, se alguém ver algum destes criminosos ligue para o /190 [Denuncia]");
		    	return 1;
			}
		}
	}
	if (strcmp(cmd, "/procurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE ||Profissao[playerid] == CHERIFE ||Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new string[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/procurar [ID].");
		    	return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
				Procurados[plid] = 1;
				SetPlayerWantedLevel(plid, 6);
				SendClientMessage(playerid, COR_VERDE, "Colocado na lista de procurados com sucesso.");
				format(string, sizeof(string), "Você está sendo perseguido pela policia, você foi colocado na lista por: %s", PlayerName(playerid));
				SendClientMessage(plid, COR_VERDE, string);
		    	return 1;
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		    	return 1;
			}
		}
		else{
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão.");
	    	return 1;
		}
	}

	if (strcmp(cmd, "/desprocurar", true)==0){
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == EXERCITO || Profissao[playerid] == CHERIFE || IsPlayerAdmin(playerid)){
		    new tmp[256];
		    new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/desprocurar [ID].");
			    return 1;
			}
	        plid = strval(tmp);
			if(IsPlayerConnected(plid) && PLAYERLIST_authed[playerid] == 1){
			    if(Procurados[plid] == 0){
					SendClientMessage(playerid, COR_VERMELHO, "O jogador não está sendo procurado!");
				    return 1;
				} else {
					Procurados[plid] = 0;
					SendClientMessage(playerid, COR_VERDE, "Excluido da lista com sucesso.");
					SendClientMessage(plid, COR_VERDE, "Você foi retirado da lista de procurados");
			    	return 1;
				}
			}
			else{
	            SendClientMessage(playerid, COR_VERMELHO, "Jogador não conectado/logado.");
		    	return 1;
			}
		}
		else {
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão!");
	    	return 1;
		}
	}


    if(strcmp(cmdtext, "/paraquedas", true) == 0) {
		GivePlayerWeapon(playerid, 46, 0);
		SendClientMessage(playerid, COR_VERDE, "Para-quedas adquirido.");
		return 1;
	}
	if(strcmp(cmd, "/ejetar", true) == 0 && IsPlayerConnected(playerid)) {
            new State;
			new tmp[256];
	    	new plid;
	    	new string[256];
            if(IsPlayerInAnyVehicle(playerid))
	        {
         	State=GetPlayerState(playerid);
		    if(State!=PLAYER_STATE_DRIVER)
		        {
		    SendClientMessage(playerid, COR_VERMELHO,"Você não pode ejetar ninguém porque não está dirigindo!");
		    return 1;
		        }
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
			SendClientMessage(playerid, COR_VERMELHO, "/ejetar [ID]");
			return 1;
		    	}
  	        plid = strval(tmp);
  	        format(string, sizeof(string), "Você ejetou %s do veiculo", PlayerName(plid));
			SendClientMessage(playerid, COR_VERMELHO, string);
            format(string, sizeof(string), "%s ejetou você do veiculo que ele está dirigindo!", PlayerName(playerid));
			SendClientMessage(plid, COR_VERDE, string);
            RemovePlayerFromVehicle(plid);
			return 1;
		}
		    return 1;
	}
    if(strcmp(cmd, "/resetargrana", true) == 0 || strcmp(cmd, "/resetardinheiro", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
	    	new string[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/resetargrana [ID]");
				return 1;
		    	}
  	        plid = strval(tmp);
  	        format(string, sizeof(string), "O seu dinheiro foi resetado por %s", PlayerName(playerid));
			SendClientMessage(plid, COR_VERMELHO, string);
            format(string, sizeof(string), "Você resetou o dinheiro de %s", PlayerName(plid));
			SendClientMessage(playerid, COR_VERDE, string);
            ResetPlayerMoney(plid);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/desarmar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/desarmar [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			    	format(string, sizeof(string), "Você desarmou %s", PlayerName(plid));
					SendClientMessage(playerid, COR_VERDE, string);
			        ResetPlayerWeapons(plid);
					format(string, sizeof(string), "Você foi desarmado por %s", PlayerName(playerid));
					SendClientMessage(plid, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para desarmar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	if (strcmp(cmdtext, "/procurados", true)==0){
		new string[256];
	    SendClientMessage(playerid, COR_AMARELO, "Lista de procurados");
	    for(new i=0; i<MAX_PLAYERS; i++){
	        if(Procurados[i] == 1){
				format(string, sizeof(string), "ID: %d, Nome: %s", i, PlayerName(i));
				SendClientMessage(i, COR_AMARELO, string);
		    	return 1;
			}
		}
	}
	
	if(strcmp(cmd, "/multar", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
		        SendClientMessage(playerid, COR_VERDE, "/multarcarteira: Multa um jogador diretamente da carteira dele.");
		        SendClientMessage(playerid, COR_VERDE, "/multarbanco: Multa um jogador diretamente da conta bancária dele.");
	            return 1;}}
	if(strcmp(cmd, "/multarbanco", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new quant;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/multarbanco [ID] [Quantidade]");
		    	return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multarbanco [ID] [Quantidade]");
		    	return 1;
			}
			quant = strval(tmp);
 			if(quant > 2500 || quant <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "O limite permitido de multas em San Fierro é de 2500.");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			    format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s, dinheiro retirado da sua conta bancária.", quant, PlayerName(playerid));
				SendClientMessage(plid, COR_VERMELHO, string);
				format(string, sizeof(string), "Você deu multa para %d, no valor de %s.",PlayerName(plid), quant);
				SendClientMessage(playerid, COR_VERDE, string);
				udb_setBankMoney(PlayerName(plid), udb_getBankMoney(PlayerName(plid)) - quant);
			    return 1;

				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para multar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/multarcarteira", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == DETETIVE || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new quant;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/multarcarteira [ID] [Quantidade]");
		    	return 1;
			}
			plid = strval(tmp);
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/multarcarteira [ID] [Quantidade]");
		    	return 1;
			}
			quant = strval(tmp);
 			if(quant > 2500 || quant <= 0){
				SendClientMessage(playerid, COR_VERMELHO, "O limite permitido de multas em San Fierro é de 2500.");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			    format(string, sizeof(string), "Você recebeu uma multa de %d dada por %s, dinheiro retirado de sua carteira.", quant, PlayerName(playerid));
				SendClientMessage(plid, COR_VERMELHO, string);
				format(string, sizeof(string), "Você deu multa para %d, no valor de %s.",PlayerName(plid), quant);
				SendClientMessage(playerid, COR_VERDE, string);
                GivePlayerMoney(plid,- quant);
			    return 1;

				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para multar!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
    if(strcmp(cmd, "/vida", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == BDR){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vida [ID]");
				return 1;
		    	}
  	        plid = strval(tmp);
            SendClientMessage(playerid, COR_VERDE, "Você completou a vida de alguem com sucesso!");
            SendClientMessage(plid, COR_VERDE, "O admin online completou sua vida.");
            SetPlayerHealth(plid, 100);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/matar", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == BDR){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/matar [ID]");
				return 1;
		    	}
  	        plid = strval(tmp);
            SendClientMessage(playerid, COR_VERDE, "Jogador morto!");
            SendClientMessage(plid, COR_VERDE, "O admin matou você.");
            SetPlayerHealth(plid, 0);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/ir", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == BDR){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/ir [ID]");
				return 1;
		    	}
  	        plid = strval(tmp);
  	        new Float:x, Float:y, Float:z;
			GetPlayerPos(plid, x, y, z);
			SetPlayerPos(playerid, x+1, y, z);
			return 1;
		}
		return 1;
	}
	if(strcmp(cmd, "/trazer", true) == 0 && IsPlayerConnected(playerid)) {
	    if(IsPlayerAdmin(playerid)|| Profissao[playerid] == BDR){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/trazer [ID]");
				return 1;
		    	}
  	        plid = strval(tmp);
  	        new Float:x, Float:y, Float:z;
			GetPlayerPos(playerid, x, y, z);
			SetPlayerPos(plid, x+1, y, z);
			return 1;
		}
		return 1;
	}
	if(!strcmp(cmd, "/criarveiculo", true))
	{
		if(IsPlayerAdmin(playerid) || Profissao[playerid] == BDR || Profissao[playerid] == VENDEDOR_DE_CARROS)
		{
		    new carid, color1, color2;
		    new tmp[256];
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) return SendClientMessage(playerid, COR_VERMELHO, "Use: /criarveiculo [ID Veiculo] [cor1] [cor2]");

			carid = strval(tmp);
			if(carid < 400 || carid > 611) return SendClientMessage(playerid, COR_VERMELHO, "Somente veículos com ID 400 a 611 são validos!");

			new Float:X, Float:Y, Float:Z;
  			GetPlayerPos(playerid, X, Y, Z);
			CreateVehicle(carid, X+3, Y, Z, 0 , color1, color2, 6);
	        return 1;
	}
}
	if(strcmp(cmd, "/mtaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == MOTOBOY || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/mtaxi [id]");
		    	return 1;
			}
			plid = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != VEH_PCJ600){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo uma moto autorizada para Moto boys.");
				SendClientMessage(playerid, COR_VERMELHO, "Use motos do modelo PCJ-600 para esse tipo de profissão.");
		    	return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O moto-taxímetro começou a rodar");
			        SendClientMessage(plid, COR_VERDE, "O moto-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
			        MTaximetro[plid][0] = 1;
					MTaximetro[plid][1] = playerid;
			    	return 1;
				}
				else {
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está na sua moto, ou você não é o condutor.");
			    	return 1;
				}
			}
	    } else {
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é motoboy.");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/ataxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA_AEREO || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)) {
	        new tmp[256];
	        new plid;
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)) {
	            SendClientMessage(playerid, COR_VERMELHO, "/ataxi [id]");
		    	return 1;
			}
			plid = strval(tmp);
			new modelo;
			cGetVehicleModelID(GetPlayerVehicleID(playerid),modelo);
			if(modelo != VEH_MAVERICK){
			    SendClientMessage(playerid, COR_VERMELHO, "Você não está dirigindo uma aeronave autorizada para sua profissão.");
				SendClientMessage(playerid, COR_VERMELHO, "Use apenas helicópteros Maverick.");
		    	return 1;
			} else {
			    if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
			        SendClientMessage(playerid, COR_VERDE, "O aero-taxímetro começou a rodar");
			        SendClientMessage(plid, COR_VERDE, "O aero-taxímetro já está rodando. A corrida está sendo cobrada a partir de agora.");
			        ATaximetro[plid][0] = 1;
					ATaximetro[plid][1] = playerid;
				    return 1;
				}
				else {
				    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está na sua moto, ou você não é o condutor.");
			    	return 1;
				}
			}
	    } else {
	        SendClientMessage(playerid, COR_VERMELHO, "Você não é taxista aéreo.");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/ttaxi", true) == 0 && IsPlayerConnected(playerid)) {
	    if(Profissao[playerid] == TAXISTA || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
	    	new plid;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/ttaxi [id]");
			    return 1;
			}
        	plid = strval(tmp);
			if(GetPlayerVehicleID(playerid) == GetPlayerVehicleID(plid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER){
                SendClientMessage(playerid, COR_VERDE, "O taxímetro começou a rodar.");
                SendClientMessage(plid, COR_VERDE, "O taxímetro começou a rodar. A bandeirada de $20 foi cobrada.");
                GivePlayerMoney(playerid,20);
                GivePlayerMoney(plid,-20);
                Taximetro[plid][0] = 1;
                Taximetro[plid][1] = playerid;
		    	return 1;
			}
			else{
			    SendClientMessage(playerid, COR_VERMELHO, "O passageiro não está dentro do seu carro ou você não é o motorista.");
		    	return 1;
			}
		}
		if(Profissao[playerid] != TAXISTA){
			SendClientMessage(playerid, COR_VERMELHO, "Você não pode executar este comando.");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/pescar", true) == 0) {
			if(PescaInProgress[playerid] == 1) {
	        SendClientMessage(playerid, COR_VERMELHO, "Calminha ae... Você já está pescando!");
	        return 1;
	        }
		    if(PescaInProgress[playerid] == 0){
		    new Float:X, Float:Y, Float:Z;
		    GetPlayerPos(playerid,X,Y,Z);
			if(X >= 351.3872 && X <= 405.0200 && Y >= -2089.7952 && Y <= -2084.7393){
			SendClientMessage(playerid,COR_VERDE,"Você lançou a rede de pesca. Espere ela voltar para concluir a pesca.");
			SendClientMessage(playerid,COR_VERDE,"Enquanto ela não vem, fique apreciando a paisagem.");
			PescaInProgress[playerid] = 1;
			SetTimer("Pesca",36000,false);
			return 1;
			}
			else {
			SendClientMessage(playerid,COR_VERMELHO,"Você não está na área de pesca, consulte um admin para saber a localização.");
			return 1;
			}
		}
	}
	if(strcmp(cmd, "/cacar", true) == 0) {
	    if(Profissao[playerid] == CACADOR || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	        if(AreaCaca[playerid] == 0){
	            SendClientMessage(playerid, COR_VERMELHO, "Você não está na área de caça, consulte o ADMIN Para Saber Onde Caçar.");
		    	return 1;
			} else {
			    if(CacaInProgress[playerid] == 1){
				    SendClientMessage(playerid, COR_VERMELHO, "Calminha aê... A sua presa não morreu ainda!");
			    	return 1;
				} else {
					SendClientMessage(playerid, COR_VERDE, "Você é um exímio caçador! Espere a presa exalar seus últimos ares de vida,");
					SendClientMessage(playerid, COR_VERDE, "para poder vendê-la.");
			    	CacaInProgress[playerid] = 1;
			    	SetTimer("Caca",36000,false);
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Você não tem permissão!");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/setcar", true) == 0) {
		if(Profissao[playerid] == VENDEDOR_DE_CARROS || Profissao[playerid] == BDR || Profissao[playerid] == LADRAO_CARROS || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
			new tmp[256];
			new carid, Float:ang, nome[256], cor1[256], cor2;

			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "Você pode usar somente carros com esses ID's: 401 à 610");
				return 1;
			}
		    carid = strval(tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcar [ID] [Nick] [Cor1] [Cor2]");
				return 1;
			}
			set(nome, tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcar [ID] [Nick] [Cor1] [Cor2]");
				return 1;
			}
			set(cor1,tmp);

    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/setcar [ID] [Nick] [Cor1] [Cor2]");
				return 1;
			}
			cor2 = strval(tmp);
			if(carid >= 400 && carid <= 611){
			    if(IsPlayerInAnyVehicle(playerid)){
			        if(IsNumeric(cor1)){
				        new string[256];
				        new File:temp;
				        new Float:X, Float:Y, Float:Z;
						GetPlayerPos(playerid, X, Y, Z);
						GetVehicleZAngle(GetPlayerVehicleID(playerid),ang);
						format(string, sizeof(string), "%d %f %f %f %f %s %d //%s\r\n", carid, X, Y, Z, ang, cor1, cor2, nome);
						temp = fopen("carrosbdr.rpg", io_append);
    	                fwrite(temp, string);
        	            fclose(temp);
            	        SendClientMessage(playerid, COR_VERDE, "Veículo salvo/setado com sucesso no [BDR]RPG Rules!");
            	        SetTimerEx("CriarVeiculo",10000,true,"dffffdd",carid,X,Y,Z,ang,strval(cor1),cor2);
						return 1;
			        } else {
				    	SendClientMessage(playerid,COR_VERMELHO,"Você entendeu errado o novo comando!");
				   		SendClientMessage(playerid,COR_PALHA,"Este /setcar não precisa de rotação, use somente");
			    		SendClientMessage(playerid,COR_PALHA,"/setcar [ID do carro] [Nome] [Cor1] e [Cor2]");

					    return 1;
			        }
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você não está em nenhum veículo e assim não pode setar um carro.");
					return 1;
				}
			}
			else{
				SendClientMessage(playerid, COR_VERMELHO, "ID fora do normal | ID's = 400-611");
				return 1;
			}
		} else {
			SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
			return 1;
		}
	}
	if(strcmp(cmd, "/relogio", true) == 0) {
		new string[256];
		format(string, sizeof(string), "Horário certo: %d:00", worldTime);
		SendClientMessage(playerid, COR_VERDE, string);
    	return 1;
	}

    if(strcmp(cmd, "/ice", true) == 0) {
        if(Profissao[playerid] == BARMAN || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/ice [id] [teor de alcool]");
		    	return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/ice [id] [teor de alcool]");
		    	return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoólico invalido. Os teores devem ser entre 2 e 7.");
		    	return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Você bebeu um drink com teor alcoólico nível %d", teor);
			            SendClientMessage(plid, COR_VERDE, string);
			            SendClientMessage(playerid, COR_VERDE, "Missão cumprida: Mais um pinguço feliz!");
				    	return 1;
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
			    	return 1;
				}
			}
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/vskol", true) == 0) {
        if(Profissao[playerid] == BARMAN || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/vskol [id] [teor de alcool]");
		    	return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vskol [id] [teor de alcool]");
		    	return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoólico invalido. Os teores devem ser entre 2 e 7.");
		    	return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Você bebeu um drink com teor alcoólico nível %d", teor);
			            SendClientMessage(plid, COR_VERDE, string);
			            SendClientMessage(playerid, COR_VERDE, "Missão cumprida: Mais um pinguço feliz!");
				    	return 1;
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
			    	return 1;
				}
			}
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
	    	return 1;
		}
	}

	if(strcmp(cmd, "/vpinga", true) == 0) {
        if(Profissao[playerid] == BARMAN || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/vpinga [id] [teor de alcool]");
		    	return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/vpinga [id] [teor de alcool]");
		    	return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoólico invalido. Os teores devem ser entre 2 e 7.");
		    	return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Você bebeu um drink com teor alcoólico nível %d", teor);
			            SendClientMessage(plid, COR_VERDE, string);
			            SendClientMessage(playerid, COR_VERDE, "Missão cumprida: Mais um pinguço feliz!");
				    	return 1;
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
			    	return 1;
				}
			}
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/vdrink", true) == 0) {
        if(Profissao[playerid] == BARMAN || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
            new string[256];
			new tmp[256];
			new plid, teor;
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)){
				SendClientMessage(playerid, COR_VERMELHO, "/drink [id] [teor de alcool]");
		    	return 1;
			}
		    plid = strval(tmp);
    	    tmp = strtok(cmdtext, idx);
			if(!strlen(tmp)) {
				SendClientMessage(playerid, COR_VERMELHO, "/drink [id] [teor de alcool]");
		    	return 1;
			}
			teor = strval(tmp);
			if(teor < 2 || teor > 7){
			    SendClientMessage(playerid, COR_VERMELHO, "Teor alcoólico invalido. Os teores devem ser entre 2 e 7.");
		    	return 1;
			}
			else{
			    if(GetDistanceBetweenPlayers(playerid, plid) <= 20){
					if(IsPlayerConnected(plid)){
					    Bebida[plid] = teor;
						format(string, sizeof(string), "Você bebeu um drink com teor alcoólico nível %d", teor);
						SendClientMessage(plid, COR_VERDE, string);
			            SendClientMessage(playerid, COR_VERDE, "Missão cumprida: Mais um pinguço feliz!");
			            
				    	return 1;
					}
					else{
					    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado!");
					    return 1;
					}
				}
				else{
				    SendClientMessage(playerid, COR_VERMELHO, "Você está muito longe, chegue mais perto para entregar a bebida.");
			    	return 1;
				}
			}
		}
		if(Profissao[playerid] != BARMAN){
		    SendClientMessage(playerid, COR_VERMELHO, "Você não tem permissão para isso");
	    	return 1;
		}
	}
	if(strcmp(cmd, "/,´", true) == 0 || strcmp(cmd, "/mp", true) == 0)
	{
		new tmp[256];
		new string[256];
	    if(IsPlayerConnected(playerid))
	    {
			tmp = strtok(cmdtext, idx);
			if(!strlen(tmp))
			{
				SendClientMessage(playerid, COR_VERMELHO, "Use: /mp [Texto]");
				return 1;
			}
			giveplayerid = strval(tmp);
			if (IsPlayerConnected(giveplayerid))
			{
                if(giveplayerid != INVALID_PLAYER_ID)
			    {
					GetPlayerName(playerid, sendername, sizeof(sendername));
					GetPlayerName(giveplayerid, giveplayer, sizeof(giveplayer));
					if(giveplayerid == playerid)
					{
					}
					new length = strlen(cmdtext);
					while ((idx < length) && (cmdtext[idx] <= ' '))
					{
						idx++;
					}
					new offset = idx;
					new result[64];
					while ((idx < length) && ((idx - offset) < (sizeof(result) - 1)))
					{
						result[idx - offset] = cmdtext[idx];
						idx++;
					}
					result[idx - offset] = EOS;
					if(!strlen(result))
					{
						SendClientMessage(playerid, COR_VERMELHO, "Use: /mp [Texto]");
						return 1;
					}
					format(string, sizeof(string), "Foi enviada a você um PM de %s(ID:%d): %s", sendername, playerid, (result));
					SendClientMessage(giveplayerid, COR_AMARELO, string);
					format(string, sizeof(string), "Você enviou PM para %s(ID: %d): %s", giveplayer, giveplayerid, (result));
					SendClientMessage(playerid,  COR_AMARELO, string);
					return 1;
				}
			}
			else
			{
					format(string, sizeof(string), "%d não está online!", giveplayerid);
					SendClientMessage(playerid, COR_VERMELHO2, string);
			}
		}
		return 1;
	}
	if(strcmp(cmd, "/examead", true) == 0) {
	    if(Profissao[playerid] == NARCOTICOS || Profissao[playerid] == BDR || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new msg[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/examead [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			        SendClientMessage(playerid,COR_AMARELO,"Resultados do exame anti-dopping:");
				    format(msg, sizeof(msg), "Heroina: %d doses",Heroina[plid]);
				    SendClientMessage(playerid,COR_BRANCO,msg);
				    format(msg, sizeof(msg), "Maconha: %d doses",Maconha[plid]);
				    SendClientMessage(playerid,COR_BRANCO,msg);
				    format(msg, sizeof(msg), "Cocaína: %d doses",Cocaina[plid]);
				    SendClientMessage(playerid,COR_BRANCO,msg);
				    SendClientMessage(playerid,COR_VERDE,"Exame anti-dopping concluído com êxito!");
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto!!!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}

/*if (strcmp("/q", cmdtext, true, 10) == 0)
{
    new string[44],pName[MAX_PLAYER_NAME];
    GetPlayerName(playerid, pName, sizeof(pName));
    format(string, sizeof(string), "%s usou o comando /q.",pName);
    SendClientMessageToAll(0xFFFFFFFF, string);
}*/
	if(strcmp(cmd, "/bafometro", true) == 0) {
	    if(Profissao[playerid] == COP_CIVIL || Profissao[playerid] == COP_MILITAR || Profissao[playerid] == KGB || Profissao[playerid] == SWAT || Profissao[playerid] == BDR || Profissao[playerid] == CIA || Profissao[playerid] == FBI || Profissao[playerid] == COP_RODOVIARIO || Profissao[playerid] == COP_ELITE || Profissao[playerid] == CHERIFE || Profissao[playerid] == EXERCITO || IsPlayerAdmin(playerid)){
	        new tmp[256];
	        new plid;
	        new string[256];
	        tmp = strtok(cmdtext, idx);
	        if(!strlen(tmp)){
	            SendClientMessage(playerid, COR_VERMELHO, "/bafometro [ID]");
		    	return 1;
			}
			plid = strval(tmp);
			if(!IsPlayerConnected(plid)){
			    SendClientMessage(playerid, COR_VERMELHO, "O jogador não está conectado");
		    	return 1;
			} else {
			    if(GetDistanceBetweenPlayers(plid,playerid) < 40){
			    	format(string, sizeof(string), "O bafômetro mostra: %d litros de álcool no sangue", Bebida[plid]);
					SendClientMessage(playerid, COR_AMARELO, string);
				    SendClientMessage(playerid, COR_VERDE, "Avalie se ele deve ser preso ou não.");
					format(string, sizeof(string), "O jogador %s está verificando seu teor de álcool!", PlayerName(playerid));
					SendClientMessage(plid, COR_VERMELHO, string);
			    	return 1;
				} else {
				    SendClientMessage(playerid,COR_VERMELHO,"Chegue mais perto para verificar o teor!");
			    	return 1;
				}
			}
		} else {
		    SendClientMessage(playerid,COR_VERMELHO,"Apenas autoridades podem fazer isso!");
	    	return 1;
		}
	}
    SendClientMessage(playerid,COR_VERMELHO2,"Comando inválido ou indisponível no [BDR]RPG Rules Brasil™");
    return 1;
}

public OnPlayerEnterVehicle(playerid,vehicleid, ispassenger)
{
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
}

public OnPlayerText(playerid,text[])
{
	new string[128];
 	new plrIP[16];
    GetPlayerIp(playerid, plrIP, sizeof(plrIP));
	GetPlayerName(playerid,string,sizeof(string));

	#if bothipandidchat
	format(string,sizeof(string),"[ID:%d] [IP:%s] %s: %s",playerid,plrIP,string,text);
	#endif
	#if ipchat
	format(string,sizeof(string),"[IP:%s] [ID:%s] %s: %s",playerid,plrIP,string,text);
	#endif
	#if idchat
	format(string,sizeof(string),"[ID:%d] %s: %s",playerid,string,text);
	#endif
	#if noipandid
	format(string,sizeof(string),"%s: %s",string,text);
	#endif

	SendClientMessageToAll(GetPlayerColor(playerid),string);

	SetPlayerChatBubble(playerid, text, GetPlayerColor(playerid), 100.0, 10000);
	return 0;

}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(newstate == PLAYER_STATE_DRIVER){
	    Petrol[playerid] = udb_getGasoline(PlayerName(playerid));
 		new id;
	    new modelo;
	    id = GetPlayerVehicleID(playerid);
		cGetVehicleModelID(id,modelo);
		if(modelo == 594){
	    return 1;
		} else {
			if(Petrol[playerid] <= 0){
				RemovePlayerFromVehicle(playerid);
				Petrol[playerid] = 0;
				SendClientMessage(playerid, COR_VERMELHO, "Você não pode andar sem gasolina, vá até o posto mais próximo e compre.");
                SendClientMessage(playerid, COR_VERMELHO, "Ou peça ao admin ou frentista online.");
				return 0;
			}
			else
			{
				Petrol[playerid]--;
  				udb_setGasoline(PlayerName(playerid), Petrol[playerid]);
            	return 0;
			}
		}
	}
	if(newstate == PLAYER_STATE_ONFOOT){
		if(Carregamento[playerid] == 1){
		    SendClientMessage(playerid,COR_VERMELHO,"Você perdeu sua carga por ter saído do veículo.");
		    Carregamento[playerid] = 0;
	    	return 1;
		}
	    else if(Taximetro[playerid][0] == 1){
			SendClientMessage(playerid, COR_VERDE, "Taxi pago.");
			SendClientMessage(Taximetro[playerid][1], COR_VERMELHO, "Você recebeu o valor da corrida até aqui.");
			GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
			GivePlayerMoney(Taximetro[playerid][1], PrecoCorrida[playerid]);
			PrecoCorrida[playerid] = 0;
			Taximetro[playerid][1] = 0;
			Taximetro[playerid][0] = 0;
	    	return 1;
		}
		else if(ATaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COR_VERDE, "Obrigado por viajar,  volte sempre.");
		    SendClientMessage(ATaximetro[playerid][1], COR_VERDE, "Você recebeu o valor da corrida até aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(ATaximetro[playerid][1], PrecoCorrida[playerid]);
		    PrecoCorrida[playerid] = 0;
		    ATaximetro[playerid][1] = 0;
		    ATaximetro[playerid][0] = 0;
	    	return 1;
		}
		else if(MTaximetro[playerid][0] == 1){
		    SendClientMessage(playerid, COR_VERDE, "Espero que tenha gostado do passeio, volte sempre.");
		    SendClientMessage(MTaximetro[playerid][1], COR_VERDE, "Você recebeu o valor da corrida até aqui.");
		    GivePlayerMoney(playerid, 0 - PrecoCorrida[playerid]);
		    GivePlayerMoney(MTaximetro[playerid][1], PrecoCorrida[playerid]);
		    PrecoCorrida[playerid] = 0;
		    MTaximetro[playerid][1] = 0;
		    MTaximetro[playerid][0] = 0;
	    	return 1;
		}
 	}
    return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	printf("Jogador de ID %d (%s) entrou em um checkpoint",playerid, PlayerName(playerid));
	SendClientMessage(playerid, COR_VERDE, "Banco 24Horas [BDR]RPG Rules Brasil™");
	SendClientMessage(playerid, COR_AMARELO, "Para ver os comandos do banco digite /banco");
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
}

stock PlayerName(playerid)
{
	new name[MAX_PLAYER_NAME];
	GetPlayerName(playerid, name, MAX_PLAYER_NAME);
 	new tmp[MAX_STRING];
  	set(tmp,udb_encode(name));
	return tmp;
}
public Bancos(playerid)
{
	new Float:X, Float:Y, Float:Z;
	for(new i=0; i<MAX_PLAYERS; i++){
		GetPlayerPos(i, X, Y, Z);
	    if(IsPlayerConnected(i)) {

			if(X >= 1700.1732 && X <= 1741.9966 && Y >= -1721.5967 && Y <= -1605.9054){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 1721.9133, -1719.0149, 13.5345, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 972.7372 && X <= 1072.9083 && Y >= -1133.2140 && Y <= -1110.8668){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 1022.6587, -1122.4553, 23.8714, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 2172.9221 && X <= 2190.9502 && Y >= 1105.2529 && Y <= 1126.5010){
			    if(AreaBanco[i] == 0) {
			        DisablePlayerCheckpoint(i);
			        SetPlayerCheckpoint(i,2183.9922,1116.0204,12.6484,2.0);
			        AreaBanco[i] = 1;
				}
			}
			else if(X >= 385.5901 && X <= 409.1007 && Y >= -1823.7596 && Y <= -1797.2906){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, 398.2190, -1805.7782, 7.8380, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1785.4990 && X <= -1714.4250 && Y >= 929.3326 && Y <= 974.9125){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -1746.1671, 962.5413, 24.8906, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -1978.6537 && X <= -1961.9292 && Y >= 113.2442 && Y <= 162.6734){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -1974.0306, 117.4207, 27.6875, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= -2482.7346 && X <= -2386.7249 && Y >= 461.5373 && Y <= 552.1155){
				if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i, -2446.5322, 522.0310, 30.2329, 2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 1951.4363 && X <= 1961.4280 && Y >= 1339.6191 && Y <= 1346.2188){
			    if(AreaBanco[i] == 0) {
			        DisablePlayerCheckpoint(i);
			        SetPlayerCheckpoint(i,1958.0383,1343.7804,15.3746,2.0);
			        AreaBanco[i] = 1;
				}
			}
			else if(X >= 2426.7166 && X <= 2445.3423 && Y >= 1671.3499 && Y <= 1687.3812){
			    if(AreaBanco[i] == 0) {
					DisablePlayerCheckpoint(i);
					SetPlayerCheckpoint(i,2437.0090,1677.0514,10.8203,2.0);
					AreaBanco[i] = 1;
				}
			}
			else if(X >= 351.3872 && X <= 405.0200 && Y >= -2089.7952 && Y <= -2084.7393){
		    	GameTextForPlayer(i,"Area de Pesca",3000,4);
			}
            else if((X >= -1496.1409 && Y <= 1884.1014 && X <= -1449.3982 && Y >= 1851.1890) || (X >= 608.2354 && X <= 619.7912 && Y >= 1851.1890 && Y <= 1884.1014) || (X >= -1332.9951 && X <= -1324.0493 && Y >= 2669.6433 && Y <= 2685.6675)){
				GameTextForPlayer(i,"~b~Posto Ipiranga",3000,4);
				AreaPosto[i] = 1;
			}
			else if((X >= 651.7850 && X <= 661.3630 && Y >= -577.0740 && Y <= -555.3830) || (X >= 2131.2070 && X <= 2161.8208 && Y >= 2735.4387 && Y <= 2762.3884) || (X >= -1615.1073 && X <= -1601.3243 && Y >= -2733.9380 && Y <= -2692.7102) || (X >= 1587.0552 && X <= 1605.8910 && Y >= 2189.7161 && Y <= 2208.1714)){
			    GameTextForPlayer(i,"~y~Posto Ray",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= 996.3851 && X <= 1011.8171 && Y >= -943.7941 && Y <= -930.1505) || (X >= -107.9445 && X <= -77.7968 && Y >= -1178.9248 && Y <= -1163.9293) || (X >= -2420.0505 && X <= -2400.0459 && Y >= 958.4067 && Y <= 997.0031) || (X >= -1703.8510 && X <= -1644.2720 && Y >= 408.3849 && Y <= 427.6900) || (X >= 2104.0168 && X <= 2136.1519 && Y >= 901.5171 && Y <= 947.6444)){
			    GameTextForPlayer(i,"~g~Posto Jason",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= -1695.3916 && X <= -1659.0499 && Y >= 412.7228 && Y <= 414.0763) || (X >= -1675.6531 && X <= -1675.1965 && Y >= 398.1009 && Y <= 434.0430) || (X >= 1932.0310 && X <= 1948.1785 && Y >= -1783.5273 && Y <= -1764.2950) || (X >= 992.8317 && X <= 1016.6620 && Y >= -945.4556 && Y <= -929.5608) || (X >= 2189.5925 && X <= 2213.6421 && Y >= 2463.2566 && Y <= 2487.5833)){
		    	GameTextForPlayer(i,"~b~Posto Mac",3000,4);
			    AreaPosto[i] = 1;
			}
			else if((X >= -38.2285 && X <= -14.9334 && Y >= -91.7449 && Y <= -74.7878) || (X >= -35.9811 && X <= -26.5833 && Y >= -31.2224 && Y <= -2.6983) || (X >= -37.2210 && X <= -14.0014 && Y >= -91.8488 && Y <= -74.6295) || (X >= -36.4902 && X <= -17.2822 && Y >= -57.9920 && Y <= -49.3070)) {
   			    GameTextForPlayer(i,"~b~24/7",1000,4);
			    AreaCoopPesca[i] = 1;
				AreaCoopCaca[i] = 1;
			}
			else if(X >= 2437.1567 && X <= 2521.2393 && Y >= -884.0734 && Y <= -825.9846){
			    GameTextForPlayer(i,"~r~Area de Caca",1000,4);
			    AreaCaca[i] = 1;
			} else if(X >= -622.7689 && X <= -466.2803 && Y >= -562.3403 && Y <= -468.5563){
			    GameTextForPlayer(i,"~b~Area de Carga",1000,4);
			    AreaCarga[i] = 1;
			} else if(X >= -70.6976 && X <= -40.9113 && Y >= -1159.8073 && Y <= -1101.6296){
				GameTextForPlayer(i,"~w~Area de Descarga",1000,4);
				AreaDescarga[i] = 1;
			} else if((X >= -335.8548 && X <= -211.2112 && Y >= -1559.2218 && Y <= -1465.4664) || (X >= -331.1028 && X <= -160.4074 && Y >= -1433.2325 && Y <= -1298.5884) ){
			    GameTextForPlayer(i,"~y~Fazenda, plante aqui!",1000,4);
			    AreaFazenda[i] = 1;
			} else if(X >= -592.5238 && X <= -572.5529 && Y >= -1521.7395 && Y <= -1470.1633){
			    GameTextForPlayer(i,"~g~Coamo, Venda do milho",1000,4);
			    AreaCoopFazenda[i] = 1;
			}
			else {
				if(AreaBanco[i] == 1) {
					DisablePlayerCheckpoint(i);
					AreaBanco[i] = 0;
				}
				if(AreaDescarga[i] == 1){
				    AreaDescarga[i] = 0;
				}
				if(AreaCarga[i] == 1){
				    AreaCarga[i] = 0;
				}
				if(AreaPosto[i] == 1) {
				    AreaPosto[i] = 0;
				}
				if(AreaCoopPesca[i] == 1) {
				    AreaCoopPesca[i] = 0;
				}
				if(AreaCaca[i] == 1) {
				    AreaCaca[i] = 0;
				}
				if(AreaCoopCaca[i] == 1) {
				    AreaCoopCaca[i] = 0;
				}
				if(AreaFazenda[i] == 1) {
				    AreaFazenda[i] = 0;
				}
				if(AreaCoopFazenda[i] == 1) {
				    AreaCoopFazenda[i] = 0;
				}
			}
		}
	}
}
public Pesca() {
	for(new i=0; i<MAX_PLAYERS; i++){
		if(IsPlayerConnected(i) == 1 && PescaInProgress[i] == 1){
			QtPescas[i]++;
			PescaInProgress[i] = 0;
			new string[256];
			new random1 = random(sizeof(NomePeixes));
            format(string, sizeof(string), "Você pescou um(a) %s",NomePeixes[random1][0]);
            SendClientMessage(i,COR_VERDE,string);
			SendClientMessage(i,COR_VERDE,"Sua rede voltou, se quiser continuar pescando, fique a vontade.");
			SendClientMessage(i,COR_VERDE,"Se não, vá até um 24/7 e venda seu pescado.");
		}
	}
}
public Caca() {
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && CacaInProgress[i] == 1){
			QtCacas[i]++;
			CacaInProgress[i] = 0;
			SendClientMessage(i,COR_VERDE,"Sua caça está pronta para ser vendida!");
			SendClientMessage(i,COR_VERDE,"Se quiser continuar caçando, fique a vontade.");
			SendClientMessage(i,COR_VERDE,"Se não, vá até um 24/7 e venda sua caça.");
		}
	}
}
public CheckFuel()
{
	for(new i=0; i<MAX_PLAYERS; i++){
 		new id;
	    new modelo;
	    id = GetPlayerVehicleID(i);
		cGetVehicleModelID(id,modelo);
		if(IsPlayerConnected(i) == 1 && IsPlayerInAnyVehicle(i) == 1 && modelo != 594){
			if(GetPlayerState(i) == 2){
				Petrol[i]--;
				udb_setGasoline(PlayerName(i), Petrol[i]);
				if(Petrol[i] <= 0){
					RemovePlayerFromVehicle(i);
					SendClientMessage(i, COR_VERMELHO, "Você não pode andar sem combustível, vá até o posto mais próximo e abasteça.");
					Petrol[i] = 0;
				    return 1;
				}
				if(Petrol[i] >= 4){
				return 1;
				}
				if(Petrol[i] < 4 || Petrol[i] >= 4){
				SendClientMessage(i,COR_VERMELHO,"ATENÇÃO: Seu combustível está quase acabando!");
				SendClientMessage(i,COR_AMARELO, "Abasteça no posto mais próximo!");
				return 1;
				}
			}
		}
	}
    return 1;
}

public MoneyGrubScoreUpdate()
{
	new CashScore;
	for(new i=0; i<MAX_PLAYERS; i++){
		if (IsPlayerConnected(i)){
   			CashScore = GetPlayerMoney(i);
			SetPlayerScore(i, CashScore);
		}
	}
}

public LogarPlayer(playerid)
{
    new Float:X, Float:Y, Float:Z, Float:ang, Float:health;
	GivePlayerMoney(playerid, udb_getAccState(PlayerName(playerid)) - GetPlayerMoney(playerid));
	udb_getHealth(PlayerName(playerid), health);
	SetPlayerHealth(playerid, health);
	udb_getPosition(PlayerName(playerid), X, Y, Z);
	udb_getAng(PlayerName(playerid), ang);
	SetSpawnInfo(playerid, 1, udb_getSkin(PlayerName(playerid)), X, Y, Z, ang, 0, 0, 0, 0, 0, 0);
	Profissao[playerid] = udb_getProf(PlayerName(playerid));
	Petrol[playerid] = udb_getGasoline(PlayerName(playerid));



	SendClientMessage(playerid, COR_VERDE, "Logado Com Sucesso.");
	SendClientMessage(playerid, COR_VERDE, "Dinheiro Restaurado.");
	SendClientMessage(playerid, COR_VERDE, "[BDR]RPG Rules Brasil™ Divirta-se.");
	SendClientMessage(playerid, COR_VERMELHO, "Para ver alguns comandos use /ajuda");
	if(udb_getPrisao(PlayerName(playerid)) == 1 || Procurados[playerid] == 1){
		Procurados[playerid] = 0;
		new cela;
		Presos[playerid] = 1;
		cela = random(4);
		SetPlayerFacingAngle(playerid,0);
		if(cela == 1){
		    SetPlayerPos(playerid,227.6684,110.1895,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		else if(cela == 2){
		    SetPlayerPos(playerid,223.0134,110.3193,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		else if(cela == 3){
		    SetPlayerPos(playerid,219.3730,110.2772,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		else if(cela == 4){
		    SetPlayerPos(playerid,214.9654,109.4626,999.0156);
		    SetPlayerInterior(playerid,10);
		}
		SendClientMessage(playerid,COR_VERMELHO,"Você cometeu um crime, por isso foi preso.");
		SendClientMessage(playerid,COR_VERMELHO,"A lei nº 1569 de San Andreas diz que:,");
        SendClientMessage(playerid,COR_VERMELHO,"Você não pode pagar fiança, procure um advogado!");
        SendClientMessage(playerid,COR_VERMELHO,"Para um julgamento justo use: /advogado.");
	}
	else{
		SpawnPlayer(playerid);
	}

}

public TempoPrisao()
{
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(Presos[i] == 1){
	        if(TempoPreso[i] == 180){
	            TempoPreso[i] = 0;
				udb_setPrisao(PlayerName(i), 0);
				Presos[i] = 0;
				SetSpawnInfo(i,0,udb_getSkin(PlayerName(i)),-1605.5067,710.3071,13.8672,0,0,0,0,0,0,0);
	    		SpawnPlayer(i);
	            SendClientMessage(i, COR_AMARELO, "Você foi solto,você teve muita sorte,agradeça na próxima vai ser mais dificil!");
			}
			else {
			    TempoPreso[i]++;
			}
		}
	}
}

stock GetDistanceBetweenPlayers(playerid,playerid2)
{
new Float:x1,Float:y1,Float:z1,Float:x2,Float:y2,Float:z2;
new Float:tmpdis;
GetPlayerPos(playerid,x1,y1,z1);
GetPlayerPos(playerid2,x2,y2,z2);
tmpdis = floatsqroot(floatpower(floatabs(floatsub(x2,x1)),2)+floatpower(floatabs(floatsub(y2,y1)),2)+floatpower(floatabs(floatsub(z2,z1)),2));
return floatround(tmpdis);
}
public Taxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(Taximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 3){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 3;
				format(string, sizeof(string), "O taxímetro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 3){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para o taxi, vai ficar aqui");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				Taximetro[i][1] = 0;
				Taximetro[i][0] = 0;
			}
		}
	}
}
public ATaxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(ATaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 15){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 15;
				format(string, sizeof(string), "O aero-taxímetro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 15){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para o taxi, vai ficar aqui.");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				ATaximetro[i][1] = 0;
				ATaximetro[i][0] = 0;
			}
		}
	}
}
public MTaxi()
{
	for(new i=0; i<MAX_PLAYERS; i++){
		if(MTaximetro[i][0] == 1){
			if(GetPlayerMoney(i) > PrecoCorrida[i] + 5){
			    new string[256];
				PrecoCorrida[i] = PrecoCorrida[i] + 5;
				format(string, sizeof(string), "O moto-taxímetro mostra: $%d", PrecoCorrida[i]);
				SendClientMessage(i, COR_VERDE, string);
				SendClientMessage(Taximetro[i][1], COR_VERDE, string);
			}
			if(GetPlayerMoney(i) < PrecoCorrida[i] + 5){
				SendClientMessage(i, COR_VERMELHO, "Você não tem mais dinheiro para o taxi,vá a pé e se ainda tiver grana pegue onibus publico.");
				SendClientMessage(Taximetro[i][1], COR_VERMELHO, "Seu passageiro ficou sem dinheiro e por isso foi deixado aqui.");
				GivePlayerMoney(i, 0 - PrecoCorrida[i]);
				GivePlayerMoney(Taximetro[i][1], PrecoCorrida[i]);
				RemovePlayerFromVehicle(i);
				PrecoCorrida[i] = 0;
				MTaximetro[i][1] = 0;
				MTaximetro[i][0] = 0;
			}
		}
	}
}
public Speed(){
	for(new i=0;i<MAX_PLAYERS;i++){
		if(IsPlayerConnected(i)){
			new Float:x,Float:y,Float:z;
			GetPlayerPos(i,x,y,z);
			new
			Float:xOff = ppos[i][0] - x,
			Float:yOff = ppos[i][1] - y,
			Float:zOff = ppos[i][2] - z,
			Float:dis = floatsqroot((xOff * xOff) + (yOff * yOff) + (zOff * zOff));
			new tmpstr[256];
			format(tmpstr,256,"~h~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~n~ ~g~Velocidade: ~p~%d ~b~km/ph ~n~ ~y~Combustivel: ~h~~r~%d ~w~Litros",floatround(((dis/1000.0)*60.0)*60.0),Petrol[i]);
            if(IsPlayerInAnyVehicle(i)){
				GameTextForPlayer(i,tmpstr,1000,3);
				Velocidade[i] = floatround(((dis/1000.0)*60.0)*60.0);
				if(Velocidade[i] > 220 && GetPlayerState(i) == PLAYER_STATE_DRIVER && VeloMulta == 1){
				    SendClientMessage(i,COR_VERMELHO,"O anti-velocidade implantado em todos os carros de San Andreas");
                    SendClientMessage(i,COR_VERMELHO,"Mostrou que você estava acima de 220 KM/H e por isso levou uma multa de R$50");
                    SendClientMessage(i,COR_AMARELO,"cuide a rapidez que anda, se no carro você é rapidinho");
                    SendClientMessage(i,COR_AMARELO,"deve ser rapidinho em outras coisas também, CORRER É O FIM!");
					GivePlayerMoney(i,-50);
				}
			}
            ppos[i][0] = x;
            ppos[i][1] = y;
            ppos[i][2] = z;
		}
	}
}
stock GetPlayerDistanceToPoint(playerid,Float:x,Float:y)
{
new Float:x1,Float:y1,Float:z1;
new Float:tmpdis;
GetPlayerPos(playerid,x1,y1,z1);
tmpdis = floatsqroot(floatpower(floatabs(floatsub(x,x1)),2)+floatpower(floatabs(floatsub(y,y1)),2));
return floatround(tmpdis);
}
public GetClosestHospital(playerid)
{
	if(!IsPlayerConnected(playerid)){
	    return -1;
	}
	new Float:prevdist = 100000.000;
	new prevhosp;
	for(new hospid = 0; hospid < 4; hospid++){
	    new Float:dist;
	    if(hospid == 0){
            dist = GetPlayerDistanceToPoint(playerid,-2651.6501,634.1177);
		}
		else if(hospid == 1){
		    dist = GetPlayerDistanceToPoint(playerid,1173.5842,-1324.5615);
		}
		else if(hospid == 2){
		    dist = GetPlayerDistanceToPoint(playerid,2031.9415,-1404.3578);
		}
		else if(hospid == 3){
		    dist = GetPlayerDistanceToPoint(playerid,1582.5615,1768.7921);
		}
		if((dist < prevdist)){
		    prevdist = dist;
		    prevhosp = hospid;
		}
	}
    return prevhosp;
}
stock LoadPickups(pattern[])
{
	new tmp[256],File:temp,Float:X,Float:Y,Float:Z;
	if(!fexist(pattern)){
		new msg[256];
	    format(msg,256,"Carregando lista de Pickups... Arquivo %s não encontrado.\nPara o salvamento de pickups, o arquivo %s foi criado.",pattern,pattern);
	    print(msg);
	    dini_Create(pattern);
	    return 1;
	}
   	new QtPickups;
   	new string[256],index;
	temp = fopen(pattern, io_readwrite);
	while(fread(temp, tmp, sizeof(tmp), false)) {
		index = 0;
		X          = Float:floatstr(strtok(tmp, index));
		Y          = Float:floatstr(strtok(tmp, index));
		Z          = Float:floatstr(strtok(tmp, index));
		format(string, sizeof(string), "%f, %f, %f", X, Y, Z);
		CreatePickup(1272, 1, Float:X, Float:Y, Float:Z);
		QtPickups++;
	}
	fclose(temp);
	print("Carregando lista de Pickups... OK!");
	format(tmp,sizeof(tmp),"%d Pickups carregados.",QtPickups);
	print(tmp);
	return 1;
}
public Tempo()
{
    worldTime++;
	worldTime%=24;
	SetWorldTime(worldTime);

    for(new i=0; i<MAX_PLAYERS; i++) {
        if(worldTime==0){
	        if(IsPlayerConnected(i)){
			if(Profissao[i] == DESEMPREGADO) {
					SendClientMessage(i, COR_AMARELO, "Você é novo e recebe dinheiro de cambios: $800");
					SendClientMessage(i, COR_AMARELO, "Peça para o admin um emprego a final todos os estrangeiros merecem!");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == TAXISTA) {
					SendClientMessage(i, COR_AMARELO, "O sindicato dos taxistas lhe depositou seu salário: $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == AGRICULTOR) {
					SendClientMessage(i, COR_AMARELO, "Suas plantações renderam: $800");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 800);
				}
				else if(Profissao[i] == VENDEDOR_DE_CARROS || Profissao[i] == CORRETOR) {
					SendClientMessage(i, COR_AMARELO, "Seu salário setando carros pros caras depositado: $200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 200);
				}
				else if(Profissao[i] == BARMAN) {
					SendClientMessage(i, COR_AMARELO, "O chefe do boteco em que você trabalha depositou seu salário: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == JUIZ) {
					SendClientMessage(i, COR_AMARELO, "Seu salário de Ordem no tribunal depositado: $2000, mas o governo");
					SendClientMessage(i, COR_AMARELO, "lhe rouba $200 para manter vivo o projeto do mensalão.");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1800);
				}
				else if(Profissao[i] == SEGURANÇA || Profissao[i] == MOTORISTA_PARTICULAR) {
					SendClientMessage(i, COR_AMARELO, "Seu salário mensal foi depositado na sua conta: $850");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 850);
				}
				else if(Profissao[i] == COP_CIVIL || Profissao[i] == COP_RODOVIARIO || Profissao[i] == COP_MILITAR) {
					SendClientMessage(i, COR_AMARELO, "Seu salário protegendo a lei foi depositado: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
                else if(Profissao[i] == ASSALTANTE) {
					SendClientMessage(i, COR_AMARELO, "O Rei do Crime depositou seu salário: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == VIDA_LOKA) {
					SendClientMessage(i, COR_AMARELO, "O Rei do Crime(serve pra qualquer país) depositou sua grana: $1893");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1893);
				}
                else if(Profissao[i] == MARINHA) {
					SendClientMessage(i, COR_AMARELO, "O Governo depositou o seu salário: $1500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
				}
				else if(Profissao[i] == COP_ELITE) {
					SendClientMessage(i, COR_AMARELO, "Seu salário pedindo pra sair foi depositado: $3000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3000);
				}
                else if(Profissao[i] == PADRE) {
					SendClientMessage(i, COR_AMARELO, "A Igreja Fé em SA Vamos Conseguir depositou: $2500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2500);
				}
				else if(Profissao[i] == CACADOR) {
					SendClientMessage(i, COR_AMARELO, "A cooperativa de caça depositou seu salário: $1000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == PESCADOR) {
					SendClientMessage(i, COR_AMARELO, "A cooperativa de pesca depositou seu salário: $750");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 750);
				}
				else if(Profissao[i] == INSTRUTOR_DE_DIRECAO) {
					SendClientMessage(i, COR_AMARELO, "Seu salário Voce treinou muita gente seu salarinho por tudo: $600");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 400);
				}
				else if(Profissao[i] == TRAFICANTE) {
				    SendClientMessage(i, COR_AMARELO, "O chefe de sua boca de fumo depositou em sua conta corrente");
				    SendClientMessage(i, COR_AMARELO, "o que o negócio está lhe rendendo: $12000");
				    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 12000);
				}
				else if(Profissao[i] == MOTORISTA_DE_ONIBUS) {
					SendClientMessage(i, COR_AMARELO, "Seu salário de motorista de onibus depositado : $900");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == CAMINHONEIRO) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário de Caraga Pesada depositado: $400");
				    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 400);
				}
				else if(Profissao[i] == NARCOTICOS) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário anti-doping depositado: $4000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 4000);
				}
				else if(Profissao[i] == DETETIVE) {
				    SendClientMessage(i,COR_AMARELO,"Sherlock Holmes depositou seu salário: $3000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 3000);
				}
                else if(Profissao[i] == MATADOR_DE_ALGUEL) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário foi depositado: $4000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 4000);
				}
				else if(Profissao[i] == IBAMA || Profissao[i] == POLICIA_FLORESTAL) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário de beijador de arvores(protetor da natureza depositado): $2500");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1500);
				}
				else if(Profissao[i] == JORNALISTA) {
				    SendClientMessage(i,COR_AMARELO,"O Departamento de Imprensa e Propaganda depositou");
				    SendClientMessage(i,COR_AMARELO,"seu salário: $1150");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1150);
				}
                else if(Profissao[i] == HOMEM_BOMBA) {
				    SendClientMessage(i,COR_AMARELO,"Osama Binladen depositou na sua conta: $1000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == ADVOGADO) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário de salafrao(advogado depositado): $1000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == PARAMEDICO) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário de medico foi depositado: $900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				    }

				else if(Profissao[i] == BDR) {
				    SendClientMessage(i,COR_AZUL,"Seu salário foi depositado com sucesso na sua conta bancária: $100000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 100000);
				    }
                else if(Profissao[i] == FRENTISTA) {
				    SendClientMessage(i,COR_AMARELO,"O dono do posto depositou seu salário: $950");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 950);
				    }

				else if(Profissao[i] == TAXISTA_AEREO) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário de taxista aereo ta aew fica trabalhado nas nuvens lol: $1200");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1200);
				}
				else if(Profissao[i] == MOTOBOY) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário salrio de moto boy depositado: $1000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1000);
				}
				else if(Profissao[i] == ENTREGADOR_PIZZA) {
				    SendClientMessage(i,COR_AMARELO,"A pizzaria em que você trabalha lhe depositou seu salário: $900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == FISCAL_DETRAN) {
				    SendClientMessage(i,COR_AMARELO,"O Detran depositou na sua conta: $900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				}
				else if(Profissao[i] == HOT_DOG) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário de vendedor de hot dogs depositado e ve se naum come todos antes de vender: $900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
				}
                else if(Profissao[i] == COMERCIO) {
				    SendClientMessage(i,COR_AMARELO,"O Paraguai depositou seu dinheiro: $1500");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1500);
				}
				else if(Profissao[i] == SORVETEIRO) {
				    SendClientMessage(i,COR_AMARELO,"Seu salário vendendo picoles pra criancinha depositado: $900");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 900);
                }
                else if(Profissao[i] == CIA) {
				    SendClientMessage(i,COR_AMARELO,"Seu Salário foi depositado: $1700");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 1700);
                }
                else if(Profissao[i] == MOTORISTA_TREM) {
				    SendClientMessage(i,COR_AMARELO,"Você já recebeu o seu salário aproveite: $2000");
				    udb_setBankMoney(PlayerName(i),udb_getBankMoney(PlayerName(i)) + 2000);
                }
                else if(Profissao[i] == PRESIDENTE) {
					SendClientMessage(i, COR_AMARELO, "Seu salário de malandro com vida boa depositado: $9000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 9000);
 				}
                else if(Profissao[i] == RAPPER) {
					SendClientMessage(i, COR_AMARELO, "50 Cent depositou na sua conta: $4000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4000);
 				}
				else if(Profissao[i] == COP_CORRUPTO) {
					SendClientMessage(i, COR_AMARELO, "Voce vendeu bastante bagulho por enquanto pagamento: $1200");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1200);
					}
				else if(Profissao[i] == CHERIFE) {
					SendClientMessage(i, COR_AMARELO, "Seu salário de Cherife rendeu-lhe: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
			    }
			    else if(Profissao[i] == KGB) {
					SendClientMessage(i, COR_AMARELO, "Seu chefe russo depositou: $4000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4000);
			    }
                else if(Profissao[i] == GANG_RIFA) {
					SendClientMessage(i, COR_AMARELO, "Seu chefe depositou: $2000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
			    }
				else if(Profissao[i] == SWAT) {
					SendClientMessage(i, COR_AMARELO, "Seu salário de especializamento na SWAT rendeu-lhe: $3500");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3500);
			    }
                else if(Profissao[i] == EXERCITO) {
					SendClientMessage(i, COR_AMARELO, "Seu salário de Soldado depositado: $5000");
					udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 5000);
	            }
				else if(Profissao [i] == LADRAO_CARROS) {
                    SendClientMessage(i, COR_AMARELO, "Seu salário de ladrão de carros foi depositado: $5000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 5000);
                }
				else if(Profissao [i] == BOXE) {
                    SendClientMessage(i, COR_AMARELO, "O Popó depositou na sua conta: $3500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3500);
                }
				else if(Profissao [i] == BOMBEIRO) {
                    SendClientMessage(i, COR_AMARELO, "Calma abaixa o fogo seu salário foi depositado: $1500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
                }
				else if(Profissao [i] == PREFEITO) {
                    SendClientMessage(i, COR_AMARELO, "Seu salario diario da vida boa foi entregue: $3080");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 3080);
                  }
                else if(Profissao [i] == REI_DO_CRIME) {
                    SendClientMessage(i, COR_AMARELO, "Seu salário totalmente sujo foi depositado: $5000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 5000);
                  }
                else if(Profissao [i] == FOTOGRAFO) {
                    SendClientMessage(i, COR_AMARELO, "As fotos foram reveladas e voce ganhou: $900");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 900);
                  }
                else if(Profissao [i] == VENDEDOR_DE_ARMAS) {
                    SendClientMessage(i, COR_AMARELO, "As armas vendidas estão lhe rendendo: $2000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 2000);
                  }
				else if(Profissao [i] == HOTELEIRO) {
                    SendClientMessage(i, COR_AMARELO, "A diária do governo foi paga: $1500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 1500);
                  }
				  else if(Profissao [i] == GOVERNADOR) {
                    SendClientMessage(i, COR_AMARELO, "Seu salario diario da vida boa foi entregue: $4500");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 4500);
                    }
                     else if(Profissao [i] == DEPUTADO) {
                    SendClientMessage(i, COR_AMARELO, "Haha ta começando a ter boa vida você ganhou: $8000");
                    udb_setBankMoney(PlayerName(i), udb_getBankMoney(PlayerName(i)) + 8000);

                  }
			   }
 			}
		}
	}

//Public do comando /plantarbomba ==============================================

public DestruirObjeto(objid) DestroyObject(objid);
public CriarExplosao(Float:X,Float:Y,Float:Z,tipo,Float:diam) CreateExplosion(X,Y,Z,tipo,diam);

//Public para mensagens no chat do jogo ========================================

public RandomMSGs()
{
new string[256];
new random1 = random(sizeof(MSGs));
new random2 = random(sizeof(CORES));
format(string, sizeof(string), "%s", MSGs[random1]);
SendClientMessageToAll(CORES[random2],string);
return 1;
}

//Public da fazenda ============================================================
public Fazenda() {
	for(new i=0; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) == 1 && FazendaInProgress[i] == 1){
			QtMilho[i]++;
			FazendaInProgress[i] = 0;
			SendClientMessage(i,COR_AMARELO,"Seu milho está ensacado e pronto para ser vendido");
			SendClientMessage(i,COR_AMARELO,"Se quiser continuar plantando use /plantarmilho novamente");
			SendClientMessage(i,COR_AMARELO,"OBS.: Se plantar sem vender. Seus sacos irão se acumulando.");
		}
	}
}

//Public para salvar carros tunings ============================================
public remodcar(vehicleid)
{
AddVehicleComponent(vehicleid, 1010);
AddVehicleComponent(vehicleid, 1086);
AddVehicleComponent(vehicleid, 1087);
AddVehicleComponent(vehicleid, 1085);
return 1;
}
//Public para saber quem se logou com a RCON ===================================
public RTi()
{
	for(new i; i<MAX_PLAYERS; i++){
	    if(IsPlayerConnected(i) && IsPlayerAdmin(i)){
			if(LoggedRcon[i] == 0){
				//new tmp[256],PName[16];
    			new string[85],PName[24];
    			GetPlayerName(i,PName,24);
    			format(string,sizeof(string),"%s se logou com RCON [BDR]RPG Rules Brasil™",PName);
				//GetPlayerName(playerid, PName, sizeof(PName));
				//format(String, sizeof(String), "%s se logou com RCON no [BDR]RPG Rules Brasil", PName);
				//GetPlayerName(i,PName,16);
				//format(tmp,256,"%s se logou com RCON no [BDR]RPG Rules Brasil™",PName);
				SendClientMessageToAll(COR_BRANCO ,string);
				LoggedRcon[i]=1;
			}
		}
	}
}
