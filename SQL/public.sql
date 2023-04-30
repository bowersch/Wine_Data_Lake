

-- ----------------------------
-- Sequence structure for ava_data_ava_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."ava_data_ava_id_seq";
CREATE SEQUENCE "public"."ava_data_ava_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for bottle_data_bottle_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bottle_data_bottle_id_seq";
CREATE SEQUENCE "public"."bottle_data_bottle_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for user_favorite_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."user_favorite_id_seq";
CREATE SEQUENCE "public"."user_favorite_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for users_user_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."users_user_id_seq";
CREATE SEQUENCE "public"."users_user_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for varietal_data_varietal_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."varietal_data_varietal_id_seq";
CREATE SEQUENCE "public"."varietal_data_varietal_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Sequence structure for winery_data_winery_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."winery_data_winery_id_seq";
CREATE SEQUENCE "public"."winery_data_winery_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 2147483647
START 1
CACHE 1;

-- ----------------------------
-- Table structure for ava_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."ava_data";
CREATE TABLE "public"."ava_data" (
  "ava_id" int4 NOT NULL DEFAULT nextval('ava_data_ava_id_seq'::regclass),
  "topography" varchar(800) COLLATE "pg_catalog"."default",
  "varietals" varchar(800) COLLATE "pg_catalog"."default",
  "climate" varchar(800) COLLATE "pg_catalog"."default",
  "ava_name" varchar(255) COLLATE "pg_catalog"."default",
  "soils" varchar(800) COLLATE "pg_catalog"."default",
  "location" varchar(800) COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."ava_data" IS 'ava_data';

-- ----------------------------
-- Records of ava_data
-- ----------------------------
INSERT INTO "public"."ava_data" VALUES (1, 'The Columbia River Gorge is a narrow, winding river valley whose walls range from steep volcanic rock faces to more gentle-sloped, terraced benchlands that are typically well suited for grape growing. The Gorge is the only sea-level passage through the Cascade Mountain Range. From north to south there are two iconic geographical features: Mt. Adams and Mt. Hood, both part of the central Cascade Mountain range', 'Albariño, Aglianico, Barbera, Cabernet Franc, Cabernet Sauvignon, Chardonnay, Dolcetto, Gamay Noir, Gewürztraminer, Grenache, Grüner Vertliner, Lemberger, Malbec, Marsanne, Merlot, Mourvedre, Muscat, Nebbiolo, Pinot Blanc, Pinot Gris, Pinot Noir, Primitivo, Riesling, Roussanne, Sangiovese, Sauvignon Blanc, Syrah, Tempranillo, Viognier, Zinfandel.', 'Within the winegrowing region, the climate in the Columbia Gorge appellation changes drastically. To the west is a cooler, marine-influenced climate where it rains 36 inches per year; to the east it’s a continental high desert climate with just 10 inches of annual rainfall. This extreme variance of climate means this area can successfully grow a wide range of classical varieties.', 'Columbia Gorge', 'The Columbia Gorge wine region soils are generally silty loams collected over time from floods, volcanic activity and landslides.', 'Just 60 miles east of Portland, the Columbia Gorge AVA lies in the heart of the Columbia River Gorge, a stunning river corridor that straddles the Columbia River for 15 miles into both Oregon and Washington. This region, which encompasses 40 miles, includes both the Columbia Gorge AVA and part of the Columbia Valley.');
INSERT INTO "public"."ava_data" VALUES (2, 'This is a huge area covering 11 million acres. Mostly, the Columbia Valley lies on the Columbia River Plateau and encompasses the valleys formed by the Columbia River and its tributaries, including the Walla Walla, Snake and Yakima rivers. Mountain ranges border the Columbia Valley region on the west and north, while the Columbia River acts roughly as a boundary to the south, and the Snake River near Idaho acts as the border to the east', 'Barbera, Black Muscat, Cabernet Franc, Cabernet Sauvignon, Carmenere, Chardonnay, Chenin Blanc, Counoise, Gamay Beaujolais, Gamay Noir, Gewürztraminer, Grenache, Lemberger, Malbec, Marsanne, Merlot, Morio Muskat, Mourvedre, Muscadelle, Muscat Canelli, Nebbiolo, Orange Muscat, Petit Verdot, Petite Sirah, Pinot Blanc, Pinot Gris, Pinot Meunier, Pinot Noir, Riesling, Roussanne, Royalty, Sangiovese, Sauvignon Blanc, Semillon, Siegerrebe, Syrah, Viognier, Zinfandel.', 'The region has a largely continental high desert climate. The hot days promote slow, even ripening, while the cool nights ensure that grapes retain their natural acidity. The area receives just 6 to 8 inches of annual rainfall, making supplemental irrigation a necessity throughout the AVA.', 'Columbia Valley', 'About 15,000 years ago a series of tremendous ice age floods (dubbed the Missoula Floods) deposited silt and sand over the area. These deposited sediments, along with wind-blown loess sediment, make up the area’s present-day soils, which are well drained and ideal for grapevines.', 'The Columbia Valley AVA is an extremely large growing region with 11 million acres of land. Most of Columbia Valley and its six sub-appellations lie in Washington State, with a small section in Oregon stretching from The Dalles to Milton-Freewater. The region is 185 miles wide and 200 miles long.');
INSERT INTO "public"."ava_data" VALUES (3, 'The Rocks District occupies a gently sloping alluvial fan deposited by the Walla Walla River, where it exits the foothills of the Blue Mountains and enters the broad flat floor of the Walla Walla Valley. Elevations range from 800 to 1,000 feet.', 'Cabernet Franc, Grenache, Malbec, Syrah, Tempranillo, Viognier.', 'The Rocks District receives an insufficient average of 15 inches of annual precipitation, so vines are irrigated with water from the Walla Walla River fed by the Blue Mountains’ snowmelt. Growing season is mostly sunny with low humidity, so major daily temperature variations are common. During summers, the region often experiences five to 10 days with temperatures exceeding 100°F.', 'The Rocks District of Milton-Freewater', 'Its defining characteristic, The Rocks’ unique soil consists of pebbles and cobbles of basalt (a dark volcanic rock) in a matrix of sand and silt. The soil is extremely well drained, encouraging vines to root deeply, and the dark rocks efficiently transfer heat into the soils and radiate heat to the ripening fruit. It is the only AVA in the U.S. with boundaries determined by a single land form and a single soil series.', 'The Rocks District of Milton-Freewater is situated in the Walla Walla Valley in northeastern Oregon, 25 miles northeast of Pendleton and five miles south of Walla Walla, Washington. The AVA derives its name from the extremely rocky soils that underlie a region just north of the small town of Milton-Freewater. With an area of only 5.9 square miles, The Rocks District is the second smallest AVA in Oregon. The Rocks District is wholly contained within both Walla Walla Valley and Columbia Valley AVAs.');
INSERT INTO "public"."ava_data" VALUES (4, 'East of the Cascade Mountain Range, this area sits at the foot of the Blue Mountains, with vineyard elevations typically ranging from 650 feet to 1,500 feet.', 'Barbera, Cabernet Franc, Cabernet Sauvignon, Carmenere, Chardonnay, Cinsault, Counoise, Dolcetto, Gewürztraminer, Malbec, Merlot, Nebbiolo, Petit Verdot, Pinot Noir, Sangiovese, Semillon, Syrah, Viognier.', 'Washington and Northern Oregon’s northern latitude position means long sunshine-filled days balanced by cool evening temperatures of the higher elevation. This temperature variation allows the grapes to develop their flavor and complexity while retaining their natural acidity. The appellation lies east of the Cascade Mountain Range, which limits the amount of rainfall to an annual 12.5 inches, allowing vintners to perfectly manage the plants through irrigation.', 'Walla Walla Valley', 'Walla Walla Valley soils come in varying combinations of well-drained loam, silt, loess and cobbles brought by a series of massive floods (dubbed the Missoula floods) some 15,000 years ago.', 'The Walla Walla Valley AVA, a sub-appellation of the larger Columbia Valley AVA, sits at the base of the Blue Mountains and stretches from the southeast corner of Washington, across the Columbia River and into the northeast corner of Oregon. Although a vast majority of this AVA’s wineries currently reside in Washington, almost half of the winegrowing acreage lies on the Oregon side.');
INSERT INTO "public"."ava_data" VALUES (20, 'NULL', 'Pinot noir, Pinot gris, Chardonnay, Gewürztraminer', 'At an elevation range between 200 and 1,000 feet, the area benefits from the rain shadow of the Coast Range with slightly lower rainfall, cooler temperatures in springtime and more temperate and dryer conditions during the critical fall harvest period. It is sheltered to the west by some of the highest peaks of the Coast Range mountains and shielded to the south by the large mass of the Chehalem Mountains.', 'Tualatin Hills', 'It offers the largest concentration in Oregon of Laurelwood soil, a windblown volcanic soil mixed with basalt known as loess that was deposited by the Missoula Floods 12,000 years ago.', 'This 15-mile slice is tucked into the northwesternmost corner of the Willamette Valley and is home to the very first commercial vineyard in Oregon, with a long agricultural history. Recognized by its distinctive soil and climate, the AVA is named for and principally defined by the watershed of the Tualatin River.');
INSERT INTO "public"."ava_data" VALUES (5, 'Vineyards here are typically at elevations of 1,200 to 2,000 feet and are planted on hillsides rather than valley floor. Rogue Valley’s diverse landscape is derived from the convergence of three mountain ranges of varying ages and structure: the Klamath Mountains, the Coastal Range and the Cascades. This region includes the Rogue River and its tributaries: the Applegate, Illinois and Bear Creek rivers.', 'Cabernet Franc, Cabernet Sauvignon, Carmenere, Chardonnay, Chenin Blanc, Dolcetto, Gewürztraminer, Grenache, Malbec, Marsanne, Merlot, Montepulciano, Mourvedre, Müller-Thurgau, Muscat, Nebbiolo, Petit Verdot, Petite Sirah, Pinot Blanc, Pinot Gris, Pinot Noir, Pinotage, Primitivo, Riesling, Roussanne, Sangiovese, Sauvignon Blanc, Semillon, Syrah, Tannat, Tempranillo, Touriga Nacional, Vermentino, Viognier, Zinfandel.', 'Rogue Valley is made up of three distinct valleys with progressively warmer microclimates, which enables the region to successfully grow both cool- and warm-climate grape varieties. To the west, the region is affected by mountain and ocean influences, making it suitable for some cool-weather varieties, including Pinot Noir. Farther east, Rogue Valley has the highest elevations (nearly 2,000 feet) of Oregon’s winegrowing regions, but it is also the warmest and the driest, making it well suited for warm-weather varieties.', 'Rogue Valley', 'Rogue Valley soil types are many and varied, including mixes of metamorphic, sedimentary and volcanic derived soils ranging from sandy loam to hard clay.', 'The Rogue Valley is the southernmost winegrowing region in Oregon. It’s made up of three adjacent river valleys (Bear Creek, Applegate and Illinois) that extend from the foothills of the Siskiyou Mountains along the California border north to the Rogue River. It is 70 miles wide by 60 miles long and encompasses the Applegate Valley sub-appellation.');
INSERT INTO "public"."ava_data" VALUES (6, 'Applegate Valley is surrounded by the Siskiyou Mountains, which were created by upthrusts of the ocean floor as a plate forced its way under the continental shelf. The Siskiyou National Forest borders the Applegate Valley to the west, and the Rogue River National Forest to the east. Vineyards are typically grown at higher elevations up to 2,000 feet.', 'Merlot, Cabernet Franc, Cabernet Sauvignon, Chardonnay, Marsanne, Petite Sirah, Primitivo, Riesling, Rousanne, Sangiovese, Syrah, Tempranillo, Viognier, Zinfandel.', 'Applegate Valley has a moderate climate that generally enjoys a warm, dry (just 25.2 inches of annual rain) growing season with hot days and cool nights perfect for warm-climate varieties.', 'Applegate Value', 'Applegate Valley’s soil types are typically granite in origin, and most of the area’s vineyards are planted on stream terraces or alluvial fans, providing deep, well-drained soils that are ideal for high-quality wine grapes', 'Applegate Valley is a sub-appellation of the Rogue Valley. It stretches 50 miles north from the California border to the Rogue River just west of Grants Pass.');
INSERT INTO "public"."ava_data" VALUES (7, 'Snake River Valley encompasses the now dry Lake Idaho. With elevation between 2,165 and 3,412 feet, this basin area appears sunken compared to the surrounding mountains, which exceed 7,000 feet. Multiple mountain ranges provide a barrier from Pacific Northwest marine influences. Vineyard elevations go as high as 3,000 feet — higher than any other winegrowing regions in the Northwest; though, most of the vineyards in Snake River Valley are at elevations between 1,500 and 2,500 feet.', 'Cabernet Franc, Cabernet Sauvignon, Canadice, Chardonnay, Cinsault, Gewürztraminer, Grenache, Lemberger, Malbec, Merlot, Mourvedre, Riesling, Syrah.', 'Located inland, and in the rain shadows of the Cascade, Sierra Nevada and Owyhee mountain ranges, the Snake River Valley receives just 10 to 12 inches of annual rainfall, most of which occurs in winter. This allows vintners to perfectly manage the plants through irrigation during the region’s relatively short (142 days on average) growing season. This area is also characterized by hot days and cool nights in summer. This drastic diurnal temperature variation helps balance natural acids and sugars, making the grapes ideal for premium winemaking.', 'Snake River Valley', 'There is a great variety of soil types in the Snake River Valley, predominantly sand, mud silts, loess and volcanic detritus on top of sedimentary rock. The soil types of the Snake River Valley are so diverse that soil is not a distinguishing factor in this appellation.', 'The Snake River Valley AVA spans southwest Idaho and significant parts of Baker and Malheur counties in Eastern Oregon. The area is a massive 8,263 square miles. Its boundaries make up the now dry, 4 million-year-old Lake Idaho, which extends 149 miles northwest to southeast, from the Oregon-Idaho state line to just west of Twin Falls, Idaho. The major Oregon cities include Ontario and Baker City.');
INSERT INTO "public"."ava_data" VALUES (8, 'The Southern Oregon AVA contains varied, mountainous features with vineyards typically situated in high mountain valleys at elevations between 1,000 to 2,000 feet. The lofty southern coastal mountains provide a barrier to the west, blocking marine air and casting a rain shadow to the area’s south and east.', 'Albariño, Baco Noir, Cabernet Sauvignon, Cabernet Franc, Canelli, Carmenere, Chardonnay, Chenin Blanc, Dolcetto, Gewürztraminer, Graciano, Grenache, Malbec, Marsanne, Merlot, Montepulciano, Mourvedre, Müller-Thurgau, Muscat, Nebbiolo, Petit Verdot, Petite Sirah, Pinot Blanc, Pinot Gris, Pinot Noir, Pinotage, Primitivo, Riesling, Rousanne, Sangiovese, Sauvignon Blanc, Semillon, Syrah, Tannat, Tempranillo, Touriga Nacional, Vermentino, Viognier, Zinfandel.', 'While this region provides the warmest growing conditions in Oregon, there exist cool microclimates within its varied hillsides and valleys that enable Southern Oregon to successfully grow both cool- and warm-climate varietals. This area receives significantly less rainfall than other viticultural areas in Oregon (40 percent less than in the Willamette Valley) and is generally a warm, sunny, arid climate.', 'Southern Oregon', 'Southern Oregon’s soils are varied and complex, though generally derived from bedrock, specifically from the 200 million year old Klamath Mountains, which are comprised of sedimentary rocks, to the west.', 'The Southern Oregon AVA exists in the southwest portion of the state, stretching 125 miles from south of Eugene to the California border, and 60 miles at its widest between the Cascade Mountain Range to the east and the Coast Range to the west. It encompasses Umpqua Valley, Rogue Valley, Red Hill Douglas County and Applegate Valley AVAs.');
INSERT INTO "public"."ava_data" VALUES (21, 'NULL', 'Pinot noir, Chardonnay, Pinot gris, Riesling, Pinot blanc, Sauvignon blanc', 'The Van Duzer Corridor is an anomaly in the Coast Range through which oceanic winds funnel into the Valley, creating a cooling effect that occurs as early as 2:00 in the afternoon. This breeze dries out the vine canopy and decreases fungus pressure, making the area highly attractive for grape growing and supporting sustainable practices by drastically reducing the need for fungus spray. As a phenomenon of wind protection, the grape skins thicken, leading to an abundance of anthocyanins (color) and tannin.', 'Van Duzer Corridor', 'NULL', 'The Van Duzer Corridor is an anomaly in the Coast Range through which oceanic winds funnel into the Valley, creating a cooling effect that occurs as early as 2:00 in the afternoon. This breeze dries out the vine canopy and decreases fungus pressure, making the area highly attractive for grape growing and supporting sustainable practices by drastically reducing the need for fungus spray. As a phenomenon of wind protection, the grape skins thicken, leading to an abundance of anthocyanins (color) and tannin.');
INSERT INTO "public"."ava_data" VALUES (9, 'The complex topography of the Umpqua Valley is a result of the collision of three mountain ranges of varying age and structure: Klamath Mountains, Coast Range and Cascades. Many say the area should not be thought of as a single valley, but, rather, more accurately the “Hundred Valleys of the Umpqua” because it is made up of a series of interconnecting small mountain ranges.', 'Albariño, Baco Noir, Cabernet Franc, Cabernet Sauvignon, Chardonnay, Dolcetto, Gewürztraminer, Graciano, Grenache, Malbec, Merlot, Muscat Canelli, Pinot Blanc, Pinot Gris, Pinot Noir, Riesling, Sauvignon Blanc, Semillon, Syrah, Tempranillo, Zinfandel.', 'The Umpqua Valley can successfully grow both cool and warm varieties. It’s comprised of three distinct climatic sub-zones: 1) The northern area around the town of Elkton enjoys a cool, marine-influenced climate. It receives around 50 inches of annual rainfall, making irrigation unnecessary. Pinot Noir and other cool-climate varieties thrive here. 2) The central area to the northwest of Roseburg has an intermediate climate where both cool and warm varieties do well. 3) The area south of Roseburg is warmer and more arid, similar to Rogue and Applegate valleys to the south, making irrigation a necessity. Warm-climate varieties, including Tempranillo, Syrah and Merlot flourish here.', 'Umpqua Valley', 'Umpqua Valley soils are as varied as the climate. Generally, they are derived from a mix of metamorphic, sedimentary and volcanic rock; though more than 150 soil types have been identified in the region. The valley floor levels have mostly deep alluvial or heavy clay materials, while the hillsides and bench locations have mixed alluvial, silt or clay structures — all excellent for winegrowing.', 'Umpqua Valley sits between the Coast Range to the west and the Cascades to the east, with the Willamette Valley to the north and the Rogue Valley, south. Named for the legendary fishing river that runs nearby, the appellation stretches 65 miles from north to south, and is 25 miles from east to west.');
INSERT INTO "public"."ava_data" VALUES (10, 'Elkton Oregon contains a wide range of terrain dissected by the broader meanders of the Umpqua River. The majority of the AVA falls below the 1,000-foot contour and includes the river bottom land — elevation 130 to 160 feet — as well as river terraces and foothills near the river — also 130 to 160 feet.', 'Baco Noir, Chardonnay, Gewürz., Pinot Gris, Pinot Noir, Riesling, Syrah', 'Elkton Oregon is the coolest and wettest region within the larger Umpqua Valley and produces different varieties and different wine styles than the rest of the larger AVA. Elkton enjoys a cool, marine-influenced climate with a longer growing season than the rest of the Umpqua. The region receives about 50 inches of rain each year.', 'Elkton Oregon', 'The AVA is dominated by the coastal mountain geology, lying over a combination of sedimentary, volcanic and metamorphic rock from the middle Eocene. More than 50 different soil series or complexes are present, made up of mostly residual clay and/or silt loam soil or cobble-rich alluvial deposits from the Yamhill and Tyee formation, and the Umpqua River terrace.', 'Located in Douglas County, the AVA is 33 miles from the Pacific Ocean, with the Cascade Range to the east, Willamette Valley to the north and Rogue Valley to the south. A part of the Umpqua Valley AVA, it is named for the town of Elkton and claims the northernmost and lowest elevation region in the Umpqua.');
INSERT INTO "public"."ava_data" VALUES (11, 'Elevation in this area ranges from the 800-foot contour line to 1,200 feet, the maximum elevation for quality grape production. Geologically, Red Hill is part of the Umpqua Formation, which is composed of basalts similar to the volcanic rocks on the Pacific Ocean floor. It has many rising domes that give it an undulating appearance.', 'Chardonnay, Pinot Noir, Riesling.', 'Red Hill Douglas County has a relatively mild climate, with daytime averages of 75°F during growing season (as opposed to regions farther south that can experience highs of 105°F). The marine influence reaching this area also provides a wetter climate than the surrounding Umpqua Valley area. Thanks to its higher elevation, the area generally enjoys a frost-free growing season.', 'Red Hill Douglas County', 'Red Hill Douglas County is dominated by iron-rich, red volcanic Jory soils, which were formed from ancient volcanic basalt and consist of silt, clay and loam soils. They are mostly deep and well drained to the 15-foot depth.', 'Red Hill Douglas County is a sub-appellation of the Umpqua Valley near the small town of Yoncalla, which lies about 30 miles north of Roseburg and parallels Interstate 5. It encompasses 5,500 acres and is a single-vineyard AVA — one of just a few in the country — with Red Hill Vineyard planted to 220 acres of vines.');
INSERT INTO "public"."ava_data" VALUES (12, 'The Willamette Valley is protected by the Coast Range to the west, the Cascades to the east and a series of hills to the north. The largest concentration of vineyards are located to the west of the Willamette River, on the leeward slopes of the Coast Range, or among the valleys created by the river’s tributaries. Most of the region’s vineyards reside a few hundred feet above sea level, with some exceptions.', 'Auxerrois, Cabernet Sauvignon, Chardonnay, Dolcetto, Gamay Noir, Gewürztraminer, Grüner Veltliner, Marechal Foch, Melon, Müller-Thurgau, Muscat, Muscat Ottonel, Pinot Blanc, Pinot Gris, Pinot Meunier, Pinot Noir, Riesling, Sauvignon Blanc, Syrah, Tempranillo.', 'Overall, the climate is mild. Winters are typically cool and wet; summers are dry and warm. Heat above 90°F only occurs 5 to 15 days per year, and the temperature drops below 0°F once every 25 years. Most rainfall occurs in the late autumn winter, and early spring, when temperatures are the coldest. The valley gets relatively little snow, 5 to 10 inches per year. This temperate climate, combined with coastal marine influences, make growing conditions ideal for cool-climate grapes, including Pinot Noir. The Willamette Valley’s warm days and cool nights during the growing season allow the fruit to develop flavor and complexity while retaining their natural acidity.', 'Willamette Valley', 'The Willamette Valley is an old volcanic and sedimentary seabed that has been overlaid with gravel, silt, rock and boulders brought by the Missoula Floods from Montana and Washington between 10,000 and 15,000 years ago. The most common of the volcanic type is red Jory soil, which is found above 300 feet (as it had escaped the Missoula Floods deposits) and is between four and six feet deep; it provides excellent drainage for wine grapes. Anything below 300 is primarily sedimentary-based soil.', 'The biggest Oregon AVA at 5,200 square miles, the Willamette Valley encompasses the drainage basin of the Willamette River. It runs from the Columbia River in Portland, south through Salem, to the Calapooya Mountains near Eugene. The Coast Range marks its west boundary and the Cascade Mountains mark the east.');
INSERT INTO "public"."ava_data" VALUES (13, 'Chehalem Mountains is a single landmass made up of hilltops, ridges and spurs uplifted from the Willamette Valley floor. The appellation includes all land in the area above the 200-foot elevation. They are the highest mountains in the Willamette Valley with their tallest point, Bald Peak, at 1,633 feet.', 'Chardonnay, Gamay Noir, Gewürztraminer, Marechal Foch, Pinot Blanc, Pinot Gris, Pinot Noir, Riesling, Syrah', 'Chehalem Mountains’ elevation goes from 200 to 1,633 feet, resulting in varied annual precipitation (37 inches at the lowest point and 60 inches at the highest) as well as the greatest variation in temperature within the Willamette Valley. These variations can result in three-week differences in the ripening of Pinot Noir.', 'Chehalem Mountains', 'The Chehalem Mountains reflect millions of years of soil accumulation, creating a rich geological experiment in one tightly packed geographical area. Within this one region there are ancient, uplifted sedimentary seabeds, weathered rich red soils from lava flows down the Columbia River and relatively new glacial sediment scoured from western states and blown onto north-facing hillsides from windstorms.', 'Encompassing over 100 square miles, the AVA touches three counties (Yamhill, Washington and Clackamas) and yet is only 19 miles from the heart of Portland and 45 miles east of the Pacific Ocean.');
INSERT INTO "public"."ava_data" VALUES (14, 'The Dundee Hills consists of a single, continuous landmass that rises above the surrounding Willamette Valley floors and is defined by the 200-foot contour line to the AVA’s highest peak of 1,067 feet. The area comprises a north-south spine with ridges with small valleys on its east, south and west sides. Dundee Hills is part of a hill chain that developed as a result of volcanic activity and the collision of the Pacific and North American plates.', 'Chardonnay, Melon de Bourgogne, Müller-Thurgau, Muscat Ottonel, Pinot Blanc, Pinot Gris, Pinot Meunier, Pinot Noir, Riesling.', 'The Dundee Hills AVA is protected from severe climatic variations by surrounding geographic features. The Coast Range to the west helps weaken effects of the Pacific’s heavy rainfall and windstorms, and casts a rain shadow over the area, resulting in only 30 to 45 inches of annual precipitation, most of which falls outside of the growing season in the winter. Slope and elevation benefit vineyards with warmer nights and less frost and fog than nearby valley floors.', 'Dundee Hills', 'Dundee Hills is known for its rich, red volcanic Jory soils, which were formed from ancient volcanic basalt and consist of silt, clay and loam soils. They typically reach a depth of 4 to 6 feet and provide excellent drainage for superior quality wine grapes.', 'Dundee Hills can be found 28 miles southwest of Portland and 40 miles inland from the Pacific Ocean. It is situated within an irregular circle of about 6,490 acres.');
INSERT INTO "public"."ava_data" VALUES (15, 'Eola Hills, and its northern extension, Amity Hills, is part of a North Willamette Valley hill chain that developed out of intense volcanic activity and the collision of the Pacific and North American plates. The main ridge of the Eola Hills runs north-south and has numerous lateral ridges on both sides that run east-west. The majority of the region’s vineyard sites exist at elevations between 250 to 700 feet.', 'Auxerrois, Chardonnay, Gamay Noir, Grüner Veltliner, Gewürztraminer, Pinot Blanc, Pinot Gris, Pinot Noir, Riesling, Sauvignon Blanc, Syrah, Tempranillo, Viognier.', 'The region enjoys a temperate climate of warm summers and mild winters, and 40 inches of annual rain, most of which falls outside of the growing season. The climate in this region is greatly influenced by its position due east of the Van Duzer Corridor, which provides a break in the Coast Range that allows cool Pacific Ocean air to flow through. This drops temperatures in the region dramatically, especially during late summer afternoons, helping to keep grape acids firm.', 'Eola-Amity Hills', 'The soils mainly contain volcanic basalt from ancient lava flows as well as marine sedimentary rocks and alluvial deposits at the lower elevations. This combination results in a relatively shallow, rocky set of well-drained soils that produce fruit with great concentration.', 'Eola-Amity Hills is about a 35-minute drive south of the Portland, and stretches from Amity in the north to Salem in the south. It’s comprised of 37,900 acres.');
INSERT INTO "public"."ava_data" VALUES (16, 'NULL', 'Pinot noir, Pinot gris, Chardonnay', 'NULL', 'Laurelwood District', 'The Laurelwood District’s boundary is the predominance of a unique soil series recognized as Laurelwood, found on the north- and east-facing slope of the Chehalem Mountains. The Laurelwood District AVA encompasses over 33,000 acres and includes the highest elevation in the Willamette Valley, at 1,633 feet. Laurelwood soil is composed of a 15-million-year-old basalt base with a loess (windblown freshwater silt) top layer accumulated over the past 200,000 years and at depths of 4’ to 0” depending on the elevation.', 'This AVA, which is nested within the Chehalem Mountains AVA, comprises more than 25 wineries and 70 vineyards');
INSERT INTO "public"."ava_data" VALUES (17, 'NULL', 'Pinot noir,Chardonnay, Riesling, Pinot gris,Sauvignon blanc', 'To the west, the region is flanked by significantly higher elevations of the Coast Range which serve to form a weather shield. The rain shadow of the peaks to the west reduces precipitation and, combined with the prevailing winds, creates a macroclimate with less disease pressure during the growing season and consistent fruit maturity, even in more difficult vintages.', 'Lower Long Tom', 'Vineyards are located on stream-cut ridge lines running east to west, with Bellpine as the predominant soil type. These clay-loams are formed from up-lifted ancient marine sediments, primarily sandstone. With Bellpine topsoils usually shallow, grapevine roots have to penetrate the sandstone below to find water and nutrients.', 'Established in November 2021, the Lower Long Tom AVA sits within the west side of the Lower Long Tom Watershed, between Corvallis and Eugene.');
INSERT INTO "public"."ava_data" VALUES (18, 'McMinnville’s elevation levels range from 200 to 1,000 feet, and the area encompasses the east and southeast slopes of the Coast Range foothills. Geologically, the most distinctive feature in this area is the Nestucca Formation, a 2,000-foot-thick bedrock formation that extends west of the city of McMinnville to the slopes of the Coast Range.', 'Pinot Blanc, Pinot Gris, Pinot Noir, Riesling, Syrah.', 'McMinnville sits in a protective rain shadow cast by the Coast Range. As a result, the primarily east- and south-facing vineyards receive less rainfall (just 33 inches annually, as compared to 40 inches in Eola-Amity Hills) than sites only 12 miles to the east. The foothills also provide protection from cold wind occurring in the spring and fall. Winegrowers also have the option of planting vineyards on more southerly facing sites to take advantage of the drying winds from the Van Duzer corridor, which helps control mold and mildew during Oregon’s humid summer days.', 'McMinnville', 'The soils are the oldest and most complex of any Oregon AVA, primarily consisting of uplifted marine sedimentary loam and silt with alluvial overlays; beneath is a base of uplifting basalt. Clay and silt loam averages 20 to 40 inches in depth — the range in which the AVA’s terroir is best achieved — before reaching harder rock and compressed sediments shot with basalt pebbles and stone.', 'McMinnville AVA sits just west of the city of McMinnville, approximately 40 miles southwest of Portland and extends 20 miles south-southwest.');
INSERT INTO "public"."ava_data" VALUES (19, 'Geographically, Ribbon Ridge is a 3.5-mile long by 1.75-mile wide ridge that extends from the Chehalem Mountains. The ridge rises 683 feet from the Chehalem Valley floor, giving it an island-like appearance.', 'Cab Sauvignon, Chardonnay, Gamay Noir, Gewürz., Pinot Noir, Pinot Gris, Riesling, Sauvignon Blanc.', 'Protected by geographical features to the north, south and west, Ribbon Ridge’s grape-growing hillsides are slightly warmer and drier when compared to the adjacent valley floors. Its moderate climate is well suited for early grape growth in the spring, consistent and even ripening over the summer and a long, full maturing season in the fall.', 'Ribbon Ridge', 'Ribbon Ridge contains mostly sedimentary soils that are younger, finer and more uniform than the alluvial sedimentary and volcanic soils of nearby regions. These well-drained, silty clay-loam soils are part of the Willakenzie series and are of low fertility and ideal for growing grapes like Pinot Noir.', 'Ribbon Ridge sits 22 miles southwest of Portland, four miles northwest of Dundee and 40 miles east of the Pacific Ocean. Ribbon Ridge is contained within the larger Chehalem Mountains.');
INSERT INTO "public"."ava_data" VALUES (22, 'Low ridges surround the towns of Yamhill and Carlton in a horseshoe shape. The free-flowing North Yamhill River courses through the center of it all. Vineyards thrive on sites with elevations between 200 and 1,000 feet, avoiding low valley frost and high elevation temperatures unsuitable for effective ripening.', 'Chardonnay, Dolcetto, Gamay Noir, Gewürztraminer, Melon, Muscat, Muscat Ottonel, Pinot Blanc, Pinot Gris, Pinot Meunier, Pinot Noir, Riesling.', 'The Coast Range to the west soars to nearly 3,500 feet, establishing a “rain shadow” over the AVA. Additional protection is afforded by Chehalem Mountain to the north and the Dundee Hills to the east. The moderate growing conditions are perfectly suited for cool-climate grapes.', 'Yamhill-Carlton', 'Yamhill-Carlton is comprised of coarse-grained, ancient marine sedimentary soils, over sandstone and siltstone that drain quickly, making them ideal for viticulture. Grapes grown in such soil often result in wines lower in acid than those made from grapes grown in basaltic or wind-blown soils', 'Yamhill-Carlton is located 35 miles southwest of Portland and 40 miles east of the Pacific Ocean; it includes the towns of Yamhill and Carlton.');

-- ----------------------------
-- Table structure for bottle_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."bottle_data";
CREATE TABLE "public"."bottle_data" (
  "bottle_id" int4 NOT NULL DEFAULT nextval('bottle_data_bottle_id_seq'::regclass),
  "pct_alcohol" varchar(255) COLLATE "pg_catalog"."default",
  "year" varchar(6) COLLATE "pg_catalog"."default",
  "clusters" varchar(255) COLLATE "pg_catalog"."default",
  "ta" varchar(255) COLLATE "pg_catalog"."default",
  "ph" varchar(255) COLLATE "pg_catalog"."default",
  "aging_process" varchar(255) COLLATE "pg_catalog"."default",
  "winery_id" varchar(30) COLLATE "pg_catalog"."default",
  "clones" varchar(255) COLLATE "pg_catalog"."default",
  "wine_name" varchar(255) COLLATE "pg_catalog"."default",
  "winery_name" varchar(255) COLLATE "pg_catalog"."default",
  "varietals" varchar(255) COLLATE "pg_catalog"."default",
  "soils" varchar(255) COLLATE "pg_catalog"."default",
  "source_file" varchar(255) COLLATE "pg_catalog"."default",
  "cases_produced" varchar(255) COLLATE "pg_catalog"."default",
  "run_date" date
)
;
COMMENT ON TABLE "public"."bottle_data" IS 'bottle_data';

-- ----------------------------
-- Records of bottle_data
-- ----------------------------
INSERT INTO "public"."bottle_data" VALUES (1, '13.0% ', '2015', '70% ', 'NULL', 'NULL', 'New & neutral French oak ', 'W-8', '943 ', 'Pinot Noir', 'Origin', 'Sedimentary ', 'NULL', '15_origin_johan.json', '99 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (2, '13.2% ', '2016', 'NULL', '5.7 g/L ', '3.62 ', 'Neutral French oak ', 'W-8', 'NULL', 'Chenin Blanc', 'Origin', 'Sedimentary ', 'NULL', '16+Chenin+Blanc+Tech.json', '49 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (3, '13.9% ', '2016', '10% ', '7.3 g/L ', '3.40 ', '10 months neutral French oak barriques ', 'W-7', 'Oregon Heirloom ', 'Gamay Noir', 'Omero', 'Sedimentary ', 'NULL', '16+Gamay+Noir.json', '450 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (4, '12.7% ', '2016', '75% ', '5.8g/L ', '3.69 ', 'neutral french oak ', 'W-6', 'NULL', 'Cabernet Franc, Gamay Noir', 'Minimus', 'Sedimentary ', 'NULL', '16+Minimus+WV+Red.json', '60 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (5, '13% ', '2016', 'NULL', '5.9 g/L ', '3.32 ', '10 months in combination of 140L Chablis casks, half barrels and neutral French barrique ', 'W-7', 'Mendoza, 108, Musqué, Old Wente, Espiquette ', 'Chardonnay', 'Omero', 'Marine-Sedimentary, Alluvial, Volcanic, ', 'NULL', '16+Omero+Chard.json', '390 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (6, '13.9% ', '2016', '10% ', '7.3 g/L ', '3.40 ', '10 months neutral French oak barriques ', 'W-7', 'Oregon Heirloom ', 'Gamay Noir', 'Omero', 'Sedimentary ', 'NULL', '16GamayNoir.json', '450 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (7, '12.8% ', '2016', '80% ', '6.0 g/L ', '3.62 ', 'neutral French oak ', 'W-6', 'Mariafeld, 943 ', 'Pinot Noir', 'Minimus', 'NULL', 'NULL', '16_dict_johan_PN+.json', '149 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (8, '13.2% ', '2016', 'NULL', '5.4 g/L ', '3.36 ', 'neutral French oak ', 'W-6', 'Mendoza ', 'Chardonnay', 'Minimus', 'Sedimentary ', 'NULL', '16_no_Mother#24.json', '25 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (9, '13.89% ', '2016', '40% ', '6.3 g/L ', '3.48 ', 'neutral French oak barriques ', 'W-6', 'NULL', 'NULL', 'Minimus', 'NULL', 'Pinot Noir, Gamay Noir and Trousseau Noir ', '16_no_Noir#23+.json', '70 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (10, '13.9% ', '2016', 'NULL', '5.0 g/L ', '3.45 ', 'Chestnut barriques, stainless steel ', 'W-6', 'NULL', 'Pinot Noir', 'Minimus', 'NULL', 'Pinot Blanc, Pinot Gris, Pinot Noir, Pinot “Gouges,” Pinot Meunier ', '16_no_Pinot#22+.json', '98 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (11, '13.69% ', '2016', 'NULL', '4.6 g/L ', '3.69 ', 'neutral French oak ', 'W-8', 'NULL', 'Pinot Noir', 'Origin', 'Sedimentary ', 'NULL', '16_origin_gouges.json', '45 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (12, '14.8% ', '2017', 'NULL', 'NULL', '3.47 ', 'Combination Amphorae & Acacia wood casks ', 'W-6', 'NULL', 'Sauvignon Blanc', 'Minimus', 'NULL', 'NULL', '17+Amphorae+SB.json', '150 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (13, '14.9% ', '2017', 'NULL', 'NULL', '3.69 ', 'neutral oak & new chestnut barriques ', 'W-6', 'NULL', 'Chardonnay', 'Minimus', 'sedimentary ', 'NULL', '17+Min+#25.json', '120 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (14, '13.0% ', '2017', '20% ', 'NULL', '3.51 ', 'nuetral French oak ', 'W-6', 'NULL', 'Chardonnay, Pinot Noir', 'Minimus', 'varied ', 'NULL', '17+MIn+WV+Red+Wine.json', '310 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (15, '12.5% ', '2017', 'NULL', 'NULL', 'NULL', 'Acacia wood & stainless steel ', 'W-6', 'NULL', 'Müller-Thurgau, Riesling', 'Minimus', 'Volcanic ', 'NULL', '17+muller+thurgau+tech.json', '110 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (16, '13.4% ', '2017', 'NULL', 'NULL', '3.6 ', 'neutral French oak barriques, half barrels and 140L Chablis casks ', 'W-7', 'Old Wenté, Calera, Musquet, Mount Eden, 108 ', 'Chardonnay', 'Omero', 'Varied ', 'NULL', '17+Omero+Chard.json', '200 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (17, '13.5% ', '2017', '10% ', 'NULL', '3.34 ', 'Neutral oak ', 'W-7', 'NULL', 'Gamay Noir', 'Omero', 'volcanic ', 'NULL', '17+Omero+Gamay.json', '460 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (18, '13.6% ', '2017', 'NULL', 'NULL', '3.43 ', 'neutral French oak ', 'W-8', 'NULL', 'Cabernet Franc', 'Origin', 'basalt ', 'NULL', '17+Origin+Cab+Franc.json', '75 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (19, '13.3% ', '2017', 'NULL', 'NULL', 'NULL', 'neutral oak ', 'W-8', 'NULL', 'Chardonnay, Sauvignon Blanc', 'Origin', 'Sedimentary ', '55% Sauvignon Blanc, 45% Chardonnay ', '17+Origin+SB+Chard.json', '150 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (20, '13.7% ', '2017', 'NULL', 'NULL', 'NULL', '9 mnths in combination neutral oak, Acacia wood, Chestnut barriques & puncheons ', 'W-6', 'NULL', 'NULL', 'Minimus', 'Varied ', 'NULL', '17+Rockwell.json', '110 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (21, '13.1% ', '2017', '30% ', 'NULL', 'NULL', 'Concrete ', 'W-6', 'NULL', 'Pinot Noir', 'Minimus', 'Varied ', 'NULL', '17+Sans-soufre+PN.json', '883 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (22, '13.7% ', '2017', 'NULL', 'NULL', '3.41 ', 'Combination concrete and neutral oak/chestnut ', 'W-6', 'NULL', 'Vermentino', 'Minimus', 'Volcanic ', 'NULL', '17+Vermentino+Tech.json', '210 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (23, '14.1% ', '2017', 'NULL', 'NULL', '3.31 ', 'neutral French oak ', 'W-6', 'NULL', 'Chardonnay', 'Minimus', 'basalt ', 'NULL', '17Mendoza+Chard.json', '80 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (24, '13.6% ', '2017', 'NULL', 'NULL', '3.38 ', 'combination neutral & new French oak ', 'W-6', 'NULL', 'Chardonnay', 'Minimus', 'sedimentary ', 'NULL', '17MInCaleraChard.json', '30 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (25, '13.9% ', '2018', '15% ', 'NULL', '3.45 ', '10 months in neutral oak barriques & puncheons ', 'W-6', 'NULL', 'Cabernet Franc, Pinot Gris, Pinot Noir', 'Minimus', 'NULL', 'NULL', '18WV+Red.json', '400 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (26, '13.8% ', '2018', '20% ', 'NULL', '3.42 ', '22 months in neutral French oak barriques ', 'W-6', 'NULL', 'Grenache, Syrah', 'Minimus', 'NULL', '78% Grenache, 24% Syrah ', '18_dict_Gre-Syrah.json', '95 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (27, '13.9% ', '2018', '90% ', 'NULL', '3.65 ', '16 months in neutral French oak barriques ', 'W-6', 'NULL', 'Syrah', 'Minimus', 'Alluvial ', '100% Syrah ', '18_MIN_SM3.json', '100 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (28, '12.7% ', '2016', '25% ', '5.8g/L ', '3.64 ', 'neutral french oak ', 'W-6', 'unknown ', 'Pinot Noir', 'Minimus', 'Sedimentary ', 'NULL', '1968+PN+Chehalem.json', '50 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (29, '12.9% ', '2016', 'NULL', 'NULL', 'NULL', 'second-filled french oak ', 'W-6', '108 ', 'Chardonnay', 'Minimus', 'Sedimentary ', 'NULL', '1984+Chard.json', '14 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (30, '12.2% ', '2019', 'NULL', 'NULL', '3.35 ', '16 months in neutral French oak ', 'W-6', 'NULL', 'Chardonnay, Sauvignon Blanc', 'Minimus', 'NULL', '69% Chardonnay, 31% Sauvignon blanc ', '19_Helix_Caroline.json', '70 cases ', NULL);
INSERT INTO "public"."bottle_data" VALUES (31, '12.9% ', '2019', 'NULL', 'NULL', '3.29 ', '7 months in neutral French oak barriques ', 'W-7', 'NULL', 'Pinot Gris', 'Omero', 'NULL', '100% Pinot Gris ', '19_Omero_PG.json', '140 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (32, ' 14.3% ', '2017', 'NULL', ' 6.10 g/L ', ' 3.61 ', 'NULL', 'W-1', '35% Pommard, 37% - 777, 23% - 114, 5% - Wadenswil ', 'Pinot Noir', 'Alloro', 'Laurelwood Series ', 'NULL', 'AlloroEPN17 TechSheet.json', '1,700 cases ', NULL);
INSERT INTO "public"."bottle_data" VALUES (33, ' 14.2% ', '2017', 'NULL', ' 6.20 g/L ', ' 3.62 ', 'NULL', 'W-1', '100% - Dijon 777 ', 'Pinot Noir', 'Alloro', 'Laurelwood Series ', 'NULL', 'AlloroJusPN17 TechSheet.json', '300 cases ', NULL);
INSERT INTO "public"."bottle_data" VALUES (34, ' 12.0% ', '2017', 'NULL', ' 8.50 g/L ', ' 2.92 ', 'NULL', 'W-1', 'NULL', 'Riesling', 'Alloro', 'Laurelwood Series ', 'NULL', 'AlloroRies17TechSheet.json', '100 cases ', NULL);
INSERT INTO "public"."bottle_data" VALUES (35, '12% ', '2018', 'NULL', 'NULL', '3.20 ', 'NULL', 'W-6', 'NULL', 'NULL', 'Minimus', 'Sedimentary ', '100% Blaufränkisch ', 'NV_dict_Blau_PétNat.json', '90 ', NULL);
INSERT INTO "public"."bottle_data" VALUES (36, '13.3% ', '2016', 'NULL', 'NULL', '3.42 ', '15 months to 3 years in 2nd fill and neutral French oak barriques ', 'W-6', 'Old Wente, Espiguette ', 'Chardonnay', 'Minimus', 'NULL', '100% Chardonnay ', 'NV_Helix_Chardonnay.json', '50 ', NULL);

-- ----------------------------
-- Table structure for terminology_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."terminology_data";
CREATE TABLE "public"."terminology_data" (
  "term" varchar(30) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(1000) COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."terminology_data" IS 'terminology_data';

-- ----------------------------
-- Records of terminology_data
-- ----------------------------
INSERT INTO "public"."terminology_data" VALUES ('Acidity', 'The acidity of wine refers to its crispness and the activation of salivary glands. Not the same as titratable acidity (TA)');
INSERT INTO "public"."terminology_data" VALUES ('Aeration', 'Aeration of wine involves the addition of oxygen, which softens the wine.');
INSERT INTO "public"."terminology_data" VALUES ('Aging', 'Aging of wine occurs by holding it in barrels or other containers, advancing the wine to a desired state.');
INSERT INTO "public"."terminology_data" VALUES ('Anosmia', 'This process describes the reduction or loss of smell.');
INSERT INTO "public"."terminology_data" VALUES ('Appellation', 'Legally defined wine-producing regions are called appellations.');
INSERT INTO "public"."terminology_data" VALUES ('Aroma', 'A wine''s aroma describes its smell, especially young wine (different than “bouquet”)');
INSERT INTO "public"."terminology_data" VALUES ('Astringent', 'Tasting term noting the harsh, bitter, and drying sensations in the mouth caused by high levels of tannin');
INSERT INTO "public"."terminology_data" VALUES ('Balance', 'The balance of a wine denotes the harmony of its various elements, including tannins, sugars, acids, and alcohol.');
INSERT INTO "public"."terminology_data" VALUES ('Barrel', 'Barrels are the oak containers used to hold wine while it ferments and ages.');
INSERT INTO "public"."terminology_data" VALUES ('Barrique', 'Oak barrels holding 225 liters originated in bordeaux, called barriques.');
INSERT INTO "public"."terminology_data" VALUES ('Bitter', 'A taste sensation that is sensed on the back of the tongue and caused by tannins');
INSERT INTO "public"."terminology_data" VALUES ('Blend', 'Some wines are blends of more than one kind of grape (varietal).');
INSERT INTO "public"."terminology_data" VALUES ('Body', 'A tactile sensation describing the weight and fullness of wine in the mouth.. A wine can be described as light, medium, or full-bodied, which refers to the weight and fullness of the wine.');
INSERT INTO "public"."terminology_data" VALUES ('Bordeaux', 'The bordeaux region in southwest france is one of the best appellations in the world.');
INSERT INTO "public"."terminology_data" VALUES ('Botrytis', 'Dessert wines with higher sugar content get their elements thanks to botrytis, which is a mold that pierces grape skins and leads to dehydration.');
INSERT INTO "public"."terminology_data" VALUES ('Bouquet', 'Aged wines contain complex aromas, also called the bouquet.');
INSERT INTO "public"."terminology_data" VALUES ('Breathing', 'Allowing wine to be exposed to oxygen is known as breathing, which enhances flavors (aeration)');
INSERT INTO "public"."terminology_data" VALUES ('Brettanomyce', 'This type of yeast is responsible for spoilage, and it creates distasteful flavors: barnyard, mousy, metallic, or bandaid-ish aromas');
INSERT INTO "public"."terminology_data" VALUES ('Brilliant', 'Sparkling clear wines may be described as having a brilliant taste.');
INSERT INTO "public"."terminology_data" VALUES ('Brix', 'A measure of the sweetness of grapes or wine and translates roughly to the percentage of sugar. If the grapes are 24 degrees brix, it means they''re about 24% sugar.');
INSERT INTO "public"."terminology_data" VALUES ('Brut', 'Sparkling wines and dry champagnes may be termed bruts, french term');
INSERT INTO "public"."terminology_data" VALUES ('Budbreak', 'A stage of annual vine development in which small shoots emerge from vine buds with young leaves unfolding and pushing through the bud scales.');
INSERT INTO "public"."terminology_data" VALUES ('Bung', 'The plug used to seal a wine barrel');
INSERT INTO "public"."terminology_data" VALUES ('Bung hole', 'A wine cask will have a bung hole, which is the opening used to fill or empty the cask.');
INSERT INTO "public"."terminology_data" VALUES ('Canopy', 'Refers to the green growth (shoots and leaves) on the vine.');
INSERT INTO "public"."terminology_data" VALUES ('Cellar', 'A temperature and humidity controlled facility to store wine. ');
INSERT INTO "public"."terminology_data" VALUES ('Chaptalization', 'Adding sugar to wine before or during fermentation to increase alcohol levels.  Chaptalization is illegal in some parts of the world and highly controlled in others.');
INSERT INTO "public"."terminology_data" VALUES ('Citric acid', 'Wines contain citric acid, a weak acid found in grapes. One of the three predominate acids in wine');
INSERT INTO "public"."terminology_data" VALUES ('Claret', 'Red bordeaux wines might be called claret by the english.');
INSERT INTO "public"."terminology_data" VALUES ('Class growth', 'The official classification of bordeaux wines originated in 1855, and it remains the standard today.');
INSERT INTO "public"."terminology_data" VALUES ('Clone', 'A variation within a grape variety, due to spontaneous mutation.  Clones of varieties may be replicated because of specific attributes such as flavor, productivity and adaptability to growing conditions.');
INSERT INTO "public"."terminology_data" VALUES ('Closed', 'Young or undeveloped wines might be described as closed if the flavors aren''t exhibiting well.');
INSERT INTO "public"."terminology_data" VALUES ('Cluster', 'A group or bunch of berries held together by the stem');
INSERT INTO "public"."terminology_data" VALUES ('Cluster set', 'Overall formation of the grape cluster following flowering. Normal clusters will be fully formed, with very few "shot berries" (missing grapes) and having uniform grape size. (see fruit set)');
INSERT INTO "public"."terminology_data" VALUES ('Cms', 'The court of master sommeliers. ');
INSERT INTO "public"."terminology_data" VALUES ('Complex', 'Wines with many flavors, nuances, or odors might be described as complex.');
INSERT INTO "public"."terminology_data" VALUES ('Cork taint', 'Wines stored in moist or moldy locations might develop undesired aromas and flavors, known as cork taint. Often associated with wet cardboard or moldy basements');
INSERT INTO "public"."terminology_data" VALUES ('Corked', 'A term that denotes a wine that has suffered cork taint (not wine with cork particles floating about)');
INSERT INTO "public"."terminology_data" VALUES ('Corkscrew', 'A device to remove a wine cork that includes a handle, worm, and lever.');
INSERT INTO "public"."terminology_data" VALUES ('Cru classe', 'The bordeaux classification of 1855 is known as cru classe.');
INSERT INTO "public"."terminology_data" VALUES ('Crush', 'The english refer to harvest as crush.');
INSERT INTO "public"."terminology_data" VALUES ('Crusher/de-stemmer', 'A mechanical device that removes the stems from the grape clusters and breaks the grape skins open, preferably without breaking the seeds.');
INSERT INTO "public"."terminology_data" VALUES ('Cuvee', 'This type of champagne is a blended batch.');
INSERT INTO "public"."terminology_data" VALUES ('Demi-sec', 'Sweet sparkling wines that are half-dry are demi-sec.');
INSERT INTO "public"."terminology_data" VALUES ('Dry', 'A taste sensation often attributed to tannins and causing puckering sensations in the mouth; the opposite of sweet. ');
INSERT INTO "public"."terminology_data" VALUES ('Earthy', 'This description refers to odors or flavors that resemble damp soil.');
INSERT INTO "public"."terminology_data" VALUES ('Enology', 'Enology refers to the science of wine-making.');
INSERT INTO "public"."terminology_data" VALUES ('Fermentation', 'Natural conversion of grape juice into wine by the presence of yeast which sets off a chemical reaction, consuming the grape sugars, causing them to convert to heat, carbon dioxide gas and alcohol. When the yeast runs out of fermentable sugar, the fermentation ends naturally and the wine is dry. A winemaker may make sweet wine by stopping the fermentation before all of the sugar is gone.');
INSERT INTO "public"."terminology_data" VALUES ('Fining', 'The addition of egg whites or gelatin (among other things) to clear the wine of unwanted particles');
INSERT INTO "public"."terminology_data" VALUES ('Finish', 'After swallowing wine, the impression of flavors and textures left in the mouth is known as the finish.');
INSERT INTO "public"."terminology_data" VALUES ('Flavors', 'The mouth perceives odors as flavors.');
INSERT INTO "public"."terminology_data" VALUES ('Foxy', 'A term that describes the musty odor and flavor of wines made from vitis labrusca, a common north american varietal');
INSERT INTO "public"."terminology_data" VALUES ('Fruit set', 'Overall formation of the grape cluster following flowering. Normal clusters will be fully formed, with very few "shot berries" (missing grapes) and having uniform grape size. (see cluster set)');
INSERT INTO "public"."terminology_data" VALUES ('Fruity', 'Wine with strong smells and flavors of fresh fruit could be described as fruity.');
INSERT INTO "public"."terminology_data" VALUES ('Full-bodied', 'A wine with much flavor and alcohol is often described as full-bodied ("big").');
INSERT INTO "public"."terminology_data" VALUES ('Head training', 'The process of training the vine into a “goblet” shape allowing sun and air to penetrate the canopy.');
INSERT INTO "public"."terminology_data" VALUES ('Herbaceous', 'A tasting term denoting odors and flavors of fresh herbs (e.g., basil, oregano, rosemary, etc.)');
INSERT INTO "public"."terminology_data" VALUES ('Hot', 'Wine that is high in alcohol would be considered hot.');
INSERT INTO "public"."terminology_data" VALUES ('Lees', 'During fermentation, sediment may accumulate that consists of grape pulp, seed, matter, and dead yeast cells, known as lees.');
INSERT INTO "public"."terminology_data" VALUES ('Leesy', 'When wine rests on its lees, it will often become rich in aromas that may lead to tasters describing it as leesy.');
INSERT INTO "public"."terminology_data" VALUES ('Length', 'Tasters note the amount of time that flavors persist in the mouth after swallowing wine; a lingering sensation');
INSERT INTO "public"."terminology_data" VALUES ('Malic acid', 'One of the three predominant acids in grapes.  Tart-tasting malic acid occurs naturally in many fruits, including apples, cherries, plums, and tomatoes.');
INSERT INTO "public"."terminology_data" VALUES ('Malolactic fermentation', 'A secondary fermentation in which the tartness of malic acid in wine is changed into a smooth, lactic sensation.  Wines described as “buttery” or “creamy” have gone through “malo.” ');
INSERT INTO "public"."terminology_data" VALUES ('Mature', 'Wine that is mature is ready to consume.');
INSERT INTO "public"."terminology_data" VALUES ('Microclimate', 'Refers to the climate immediately surrounding the individual vine canopy (or green growth) and clusters.');
INSERT INTO "public"."terminology_data" VALUES ('Mouth feel', 'Tasters will describe how wine feels on the palate,  it can be rough, smooth, velvety, or furry. ');
INSERT INTO "public"."terminology_data" VALUES ('Must', 'Freshly crushed grapes, ready for fermentation. Usually includes juice, skins and seeds; everything but the stems.');
INSERT INTO "public"."terminology_data" VALUES ('Negociant', 'A negociant is a wholesale blender, merchant, or wine shipper.');
INSERT INTO "public"."terminology_data" VALUES ('Noble rot', 'Noble rot is another term for botrytis.');
INSERT INTO "public"."terminology_data" VALUES ('Nose', 'A taster might use this term to describe a wine''s aromas and bouquets of a wine. ');
INSERT INTO "public"."terminology_data" VALUES ('NWS', 'The national wine school. ');
INSERT INTO "public"."terminology_data" VALUES ('Oak', 'A wine described as oaky might have flavors and aromas such as coconut, mocha, vanilla, or dill, which develop during barrel aging.');
INSERT INTO "public"."terminology_data" VALUES ('Oaky', 'Tasting term denoting smells and flavors of vanilla, baking spices, coconut, mocha, or dill caused by barrel-aging');
INSERT INTO "public"."terminology_data" VALUES ('Oenology', 'Oenology, also called enology, is the science of wine-making.');
INSERT INTO "public"."terminology_data" VALUES ('Open', 'A wine that is ready to drink is known as open.');
INSERT INTO "public"."terminology_data" VALUES ('Oxidation', 'When wine is exposed to oxygen, oxidation occurs.');
INSERT INTO "public"."terminology_data" VALUES ('Phenolic compounds', 'Natural compounds present in grape skins and seeds (');
INSERT INTO "public"."terminology_data" VALUES ('Photosynthesis', 'A biochemical reaction combining water and carbon dioxide using the sun’s energy to produce sugars in plants.');
INSERT INTO "public"."terminology_data" VALUES ('Phylloxera', 'A microscopic insect that kills grape vines by attacking their roots');
INSERT INTO "public"."terminology_data" VALUES ('Plonk', 'British slang for inexpensive wine; also used to describe very low-quality wines');
INSERT INTO "public"."terminology_data" VALUES ('Pruning', 'Process of cutting off old wood in order to produce fewer, but larger bunches of larger grapes.');
INSERT INTO "public"."terminology_data" VALUES ('Ratings', 'Wine reviews based on a hundred-point scale. ');
INSERT INTO "public"."terminology_data" VALUES ('Rosé', 'Pink wines made from red grapes.');
INSERT INTO "public"."terminology_data" VALUES ('Rough', 'An astringent wine might be described as having a rough sensation in the mouth.');
INSERT INTO "public"."terminology_data" VALUES ('Sec', 'Sec is a french term for dry.');
INSERT INTO "public"."terminology_data" VALUES ('Shatter', 'Crop loss due to impaired pollination.  Normally this means missing grapes from within the cluster rather than the loss of the whole cluster. The most common causes of shatter are heavy rain, hail, extreme heat or heavy wind.');
INSERT INTO "public"."terminology_data" VALUES ('Shoot', 'New growth in a vine that develops from a bud and consists of a stem and leaves.');
INSERT INTO "public"."terminology_data" VALUES ('Sommelier', 'A wine butler; also used to denote a certified wine professional. ');
INSERT INTO "public"."terminology_data" VALUES ('Spicy', 'A wine might be described as spicy if it has black pepper, curry, oregano, rosemary, saffron, paprika, or other spicy odors and flavors.');
INSERT INTO "public"."terminology_data" VALUES ('Structure', 'A taster might refer to a wine''s structure, which includes the harmony or its tannins, acidity, alcohol, and fruit.');
INSERT INTO "public"."terminology_data" VALUES ('Summer pruning', 'Optional vineyard operation designed to improve quality by sacrificing quantity.');
INSERT INTO "public"."terminology_data" VALUES ('Supertaster', 'An individual with the genetic ability to taste a wider array tannins and other bitter compounds. ');
INSERT INTO "public"."terminology_data" VALUES ('Sweet', 'Wine with perceptible sugar content will be described as sweet.');
INSERT INTO "public"."terminology_data" VALUES ('Syrah', 'A fruity red wine that often has flavors of pepper, spice, black cherry, leather and roasted nuts.  It has a smooth, supple texture and smooth tannins. Its approachable style complements mediterranean-style foods and dark, rich chocolate.');
INSERT INTO "public"."terminology_data" VALUES ('Tannins', 'The phenolic compounds in wines that leave a bitter, dry, and puckery feeling in the mouth. ');
INSERT INTO "public"."terminology_data" VALUES ('Tartaric acid', 'The principal acid in grapes, tartaric acid promotes flavor and aging in wine');
INSERT INTO "public"."terminology_data" VALUES ('Tendrils', 'Tendrils develop at two of every three consecutive nodes.  They coil and clasp, enabling the stems of grapevines to climb.');
INSERT INTO "public"."terminology_data" VALUES ('Terroir', 'Refers to all of the elements in nature that influence the character of the fruit: soil, subsoil, microclimate, drainage, elevation, sun exposure, and prevailing winds. The varietal character of a wine is strongly influenced by the local terroir.');
INSERT INTO "public"."terminology_data" VALUES ('Texture', 'Texture describes how a wine feels in the mouth.');
INSERT INTO "public"."terminology_data" VALUES ('Thinning', 'Removal of unwanted shoots to reduce canopy density or unwanted clusters or shoots; helps improve wine quality.');
INSERT INTO "public"."terminology_data" VALUES ('Typicity', 'This word is used to describe how a wine expresses the characteristics of the grape variety.');
INSERT INTO "public"."terminology_data" VALUES ('Ullage', 'As wine evaporates in barrels or bottles, the empty space is known as ullage.');
INSERT INTO "public"."terminology_data" VALUES ('Up on wires', 'The process of training the vine shoots out onto lateral wires for support. This method allows for greater production of fruit.');
INSERT INTO "public"."terminology_data" VALUES ('Varietal', 'Types of wines made from a specific variety of grape, i.e., cabernet sauvignon and chardonnay are varietals.');
INSERT INTO "public"."terminology_data" VALUES ('Vegetal', 'Tasting term describing characteristics of fresh or cooked vegetables detected on the nose and in the flavors of the wine.  Bell peppers, grass, and asparagus are common “vegetal” descriptors.');
INSERT INTO "public"."terminology_data" VALUES ('Veraison', 'When grapes begin to soften and change color; white varieties from green to yellow-green and reds from green to purple.');
INSERT INTO "public"."terminology_data" VALUES ('Vinification', 'Vinification is the process of winemaking.');
INSERT INTO "public"."terminology_data" VALUES ('Vinology', 'The scientific study of wines and winemaking. Also, the website for the wine school.');
INSERT INTO "public"."terminology_data" VALUES ('Vintage', 'A wine''s vintage is the year it is bottled.');
INSERT INTO "public"."terminology_data" VALUES ('Vitis vinifera', 'More than 99 percent of the wines in the world come from the vitis vinifera grape species.');
INSERT INTO "public"."terminology_data" VALUES ('Weight', 'The sensation of wine on the palate may be described as having a thick weight, similar to “body,”');
INSERT INTO "public"."terminology_data" VALUES ('Wine', 'The fermented juice of grapes is wine.');
INSERT INTO "public"."terminology_data" VALUES ('Wine glass', 'A drinking vessel specially designed to tasting wine. ');
INSERT INTO "public"."terminology_data" VALUES ('Wine tasting', 'The act of perceiving flavors in wine by using the three esses: see, swirl, sniff, sip, and savor. ');
INSERT INTO "public"."terminology_data" VALUES ('WSET', 'The wine & spirit education trust.  Sommelier courses in america');
INSERT INTO "public"."terminology_data" VALUES ('Yeast', 'Yeast is a microorganism that converts grape sugars to alcohol.');
INSERT INTO "public"."terminology_data" VALUES ('Yield', 'A vineyard''s productivity is its yield.');
INSERT INTO "public"."terminology_data" VALUES ('Young', 'An immature wine that is usually bottled and sold within a year of its vintage.  Wines meant to be drunk “young” are noted for their fresh and crisp flavors.');

-- ----------------------------
-- Table structure for user_favorite
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_favorite";
CREATE TABLE "public"."user_favorite" (
  "id" int4 NOT NULL DEFAULT nextval('user_favorite_id_seq'::regclass),
  "user_id" int4 NOT NULL,
  "fav_id" int4 NOT NULL,
  "type" int2 NOT NULL,
  "create_time" timestamp(6),
  "op_time" timestamp(6)
)
;
COMMENT ON COLUMN "public"."user_favorite"."type" IS '1.ava 2 winery,3.techsheet';
COMMENT ON TABLE "public"."user_favorite" IS 'user_favorite';

-- ----------------------------
-- Records of user_favorite
-- ----------------------------
INSERT INTO "public"."user_favorite" VALUES (1, 1, 1, 1, NULL, NULL);
INSERT INTO "public"."user_favorite" VALUES (2, 1, 2, 1, NULL, NULL);
INSERT INTO "public"."user_favorite" VALUES (3, 2, 1, 1, NULL, NULL);
INSERT INTO "public"."user_favorite" VALUES (4, 2, 2, 2, NULL, NULL);
INSERT INTO "public"."user_favorite" VALUES (5, 2, 1, 2, NULL, NULL);
INSERT INTO "public"."user_favorite" VALUES (6, 3, 1, 1, NULL, NULL);
INSERT INTO "public"."user_favorite" VALUES (7, 8, 1, 3, NULL, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS "public"."users";
CREATE TABLE "public"."users" (
  "user_id" int4 NOT NULL DEFAULT nextval('users_user_id_seq'::regclass),
  "user_name" varchar(50) COLLATE "pg_catalog"."default",
  "user_old" int4,
  "address" varchar(800) COLLATE "pg_catalog"."default",
  "phone" varchar(50) COLLATE "pg_catalog"."default",
  "email" varchar(50) COLLATE "pg_catalog"."default",
  "create_time" int8,
  "op_time" int8
)
;
COMMENT ON TABLE "public"."users" IS 'users';

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO "public"."users" VALUES (1, 'leroyjenkins', 35, NULL, '1312345678', NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (2, 'A', 43, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (3, 'B', 28, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (4, 'C', 50, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (5, 'D', 33, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (6, 'E', 34, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (7, 'F', 28, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (8, 'G', 45, NULL, NULL, NULL, NULL, NULL);
INSERT INTO "public"."users" VALUES (9, 'H', 46, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for varietal_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."varietal_data";
CREATE TABLE "public"."varietal_data" (
  "varietal_id" int4 NOT NULL DEFAULT nextval('varietal_data_varietal_id_seq'::regclass),
  "varietal_name" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."varietal_data" IS 'varietal_data';

-- ----------------------------
-- Records of varietal_data
-- ----------------------------
INSERT INTO "public"."varietal_data" VALUES (1, 'Auxerrois');
INSERT INTO "public"."varietal_data" VALUES (2, 'Baco Noir');
INSERT INTO "public"."varietal_data" VALUES (3, 'Barbera');
INSERT INTO "public"."varietal_data" VALUES (4, 'Black Muscat');
INSERT INTO "public"."varietal_data" VALUES (5, 'Cab Sauvignon');
INSERT INTO "public"."varietal_data" VALUES (6, 'Cabernet Franc');
INSERT INTO "public"."varietal_data" VALUES (7, 'Cabernet Sauvignon');
INSERT INTO "public"."varietal_data" VALUES (8, 'Canadice');
INSERT INTO "public"."varietal_data" VALUES (9, 'Canelli');
INSERT INTO "public"."varietal_data" VALUES (10, 'Carmenere');
INSERT INTO "public"."varietal_data" VALUES (11, 'Chardonnay');
INSERT INTO "public"."varietal_data" VALUES (12, 'Chenin Blanc');
INSERT INTO "public"."varietal_data" VALUES (13, 'Cinsault');
INSERT INTO "public"."varietal_data" VALUES (14, 'Counoise');
INSERT INTO "public"."varietal_data" VALUES (15, 'Dolcetto');
INSERT INTO "public"."varietal_data" VALUES (16, 'Gamay Beaujolais');
INSERT INTO "public"."varietal_data" VALUES (17, 'Gamay Noir');
INSERT INTO "public"."varietal_data" VALUES (18, 'Gewürztraminer');
INSERT INTO "public"."varietal_data" VALUES (19, 'Graciano');
INSERT INTO "public"."varietal_data" VALUES (20, 'Grenache');
INSERT INTO "public"."varietal_data" VALUES (21, 'Grüner Veltliner');
INSERT INTO "public"."varietal_data" VALUES (22, 'Lemberger');
INSERT INTO "public"."varietal_data" VALUES (23, 'Malbec');
INSERT INTO "public"."varietal_data" VALUES (24, 'Marechal Foch');
INSERT INTO "public"."varietal_data" VALUES (25, 'Marsanne');
INSERT INTO "public"."varietal_data" VALUES (26, 'Melon');
INSERT INTO "public"."varietal_data" VALUES (27, 'Melon de Bourgogne');
INSERT INTO "public"."varietal_data" VALUES (28, 'Merlot');
INSERT INTO "public"."varietal_data" VALUES (29, 'Montepulciano');
INSERT INTO "public"."varietal_data" VALUES (30, 'Morio Muskat');
INSERT INTO "public"."varietal_data" VALUES (31, 'Mourvedre');
INSERT INTO "public"."varietal_data" VALUES (32, 'Müller-Thurgau');
INSERT INTO "public"."varietal_data" VALUES (33, 'Muscadelle');
INSERT INTO "public"."varietal_data" VALUES (34, 'Muscat');
INSERT INTO "public"."varietal_data" VALUES (35, 'Muscat Canelli');
INSERT INTO "public"."varietal_data" VALUES (36, 'Muscat Ottonel');
INSERT INTO "public"."varietal_data" VALUES (37, 'Nebbiolo');
INSERT INTO "public"."varietal_data" VALUES (38, 'Orange Muscat');
INSERT INTO "public"."varietal_data" VALUES (39, 'Petit Verdot');
INSERT INTO "public"."varietal_data" VALUES (40, 'Petite Sirah');
INSERT INTO "public"."varietal_data" VALUES (41, 'Pinot Blanc');
INSERT INTO "public"."varietal_data" VALUES (42, 'Pinot Gris');
INSERT INTO "public"."varietal_data" VALUES (43, 'Pinot Meunier');
INSERT INTO "public"."varietal_data" VALUES (44, 'Pinot Noir');
INSERT INTO "public"."varietal_data" VALUES (45, 'Pinotage');
INSERT INTO "public"."varietal_data" VALUES (46, 'Primitivo');
INSERT INTO "public"."varietal_data" VALUES (47, 'Riesling');
INSERT INTO "public"."varietal_data" VALUES (48, 'Roussanne');
INSERT INTO "public"."varietal_data" VALUES (49, 'Royalty');
INSERT INTO "public"."varietal_data" VALUES (50, 'Sangiovese');
INSERT INTO "public"."varietal_data" VALUES (51, 'Sauvignon Blanc');
INSERT INTO "public"."varietal_data" VALUES (52, 'Semillon');
INSERT INTO "public"."varietal_data" VALUES (53, 'Siegerrebe');
INSERT INTO "public"."varietal_data" VALUES (54, 'Syrah');
INSERT INTO "public"."varietal_data" VALUES (55, 'Tannat');
INSERT INTO "public"."varietal_data" VALUES (56, 'Tempranillo');
INSERT INTO "public"."varietal_data" VALUES (57, 'Touriga Nacional');
INSERT INTO "public"."varietal_data" VALUES (58, 'Vermentino');
INSERT INTO "public"."varietal_data" VALUES (59, 'Viognier');
INSERT INTO "public"."varietal_data" VALUES (60, 'Zinfandel');

-- ----------------------------
-- Table structure for winery_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."winery_data";
CREATE TABLE "public"."winery_data" (
  "winery_id" int4 NOT NULL DEFAULT nextval('winery_data_winery_id_seq'::regclass),
  "address" varchar(255) COLLATE "pg_catalog"."default",
  "phone_number" varchar(30) COLLATE "pg_catalog"."default",
  "winery_url" varchar(255) COLLATE "pg_catalog"."default",
  "winery_name" varchar(255) COLLATE "pg_catalog"."default",
  "winemaker" varchar(255) COLLATE "pg_catalog"."default"
)
;
COMMENT ON TABLE "public"."winery_data" IS 'winery_data';

-- ----------------------------
-- Records of winery_data
-- ----------------------------
INSERT INTO "public"."winery_data" VALUES (1, '22185 SW Lebeau Road, Sherwood, Oregon 97140', '503.625.1978', 'https://www.allorovineyard.com/', 'Alloro', 'Tom Fitzpatrick');
INSERT INTO "public"."winery_data" VALUES (2, '6580 NE Mineral Springs Rd., Carlton, OR 9711', '503.864.2991', 'https://anneamie.com/', 'Anne Amie', 'GABRIELA SEPULVEDA VIGNES');
INSERT INTO "public"."winery_data" VALUES (3, '18599 NE Archery Summit RoadDayton, OR 97114', '503.714.2030', 'https://www.archerysummit.com/', 'Archery Summit', 'Ian Burch');
INSERT INTO "public"."winery_data" VALUES (4, '2621 NW 30th Avenue, Portland, OR 97210', '503.224.5778', 'https://boedeckercellars.com/', 'Boedecker', 'Stewart Boedecker, Athena Pappas');
INSERT INTO "public"."winery_data" VALUES (5, '236 N. Kutch St. Carlton, OR 97111', '503-852-7070', 'https://kenwrightcellars.com/', 'Ken Writght Cellars', 'Ken & Karen Wright');
INSERT INTO "public"."winery_data" VALUES (6, '116 W Main St. Catlgon, OR 97111', '503.852.3033', 'https://www.craftwineco.com/', 'Minimus', 'NULL');
INSERT INTO "public"."winery_data" VALUES (7, '117 W Main St. Catlgon, OR 97111', '503.852.3034', 'https://www.craftwineco.com/', 'Omero', 'NULL');
INSERT INTO "public"."winery_data" VALUES (8, '118 W Main St. Catlgon, OR 97111', '503.852.3035', 'https://www.craftwineco.com/', 'Origin', 'NULL');

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."ava_data_ava_id_seq"
OWNED BY "public"."ava_data"."ava_id";
SELECT setval('"public"."ava_data_ava_id_seq"', 22, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."bottle_data_bottle_id_seq"
OWNED BY "public"."bottle_data"."bottle_id";
SELECT setval('"public"."bottle_data_bottle_id_seq"', 36, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."user_favorite_id_seq"
OWNED BY "public"."user_favorite"."id";
SELECT setval('"public"."user_favorite_id_seq"', 1, false);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."users_user_id_seq"
OWNED BY "public"."users"."user_id";
SELECT setval('"public"."users_user_id_seq"', 1, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."varietal_data_varietal_id_seq"
OWNED BY "public"."varietal_data"."varietal_id";
SELECT setval('"public"."varietal_data_varietal_id_seq"', 60, true);

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."winery_data_winery_id_seq"
OWNED BY "public"."winery_data"."winery_id";
SELECT setval('"public"."winery_data_winery_id_seq"', 8, true);

-- ----------------------------
-- Primary Key structure for table ava_data
-- ----------------------------
ALTER TABLE "public"."ava_data" ADD CONSTRAINT "pk_ava_data" PRIMARY KEY ("ava_id");

-- ----------------------------
-- Primary Key structure for table bottle_data
-- ----------------------------
ALTER TABLE "public"."bottle_data" ADD CONSTRAINT "pk_bottle_data" PRIMARY KEY ("bottle_id");

-- ----------------------------
-- Primary Key structure for table terminology_data
-- ----------------------------
ALTER TABLE "public"."terminology_data" ADD CONSTRAINT "pk_terminology_data" PRIMARY KEY ("term");

-- ----------------------------
-- Primary Key structure for table user_favorite
-- ----------------------------
ALTER TABLE "public"."user_favorite" ADD CONSTRAINT "pk_user_favorite" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table users
-- ----------------------------
ALTER TABLE "public"."users" ADD CONSTRAINT "pk_users" PRIMARY KEY ("user_id");

-- ----------------------------
-- Primary Key structure for table varietal_data
-- ----------------------------
ALTER TABLE "public"."varietal_data" ADD CONSTRAINT "pk_varietal_data" PRIMARY KEY ("varietal_id");

-- ----------------------------
-- Primary Key structure for table winery_data
-- ----------------------------
ALTER TABLE "public"."winery_data" ADD CONSTRAINT "pk_winery_data" PRIMARY KEY ("winery_id");
