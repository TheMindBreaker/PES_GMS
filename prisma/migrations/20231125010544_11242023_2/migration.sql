-- CreateTable
CREATE TABLE `genset03` (
    `paramId` INTEGER NOT NULL AUTO_INCREMENT,
    `gensetId` INTEGER NOT NULL,
    `p0` SMALLINT NOT NULL DEFAULT 0,
    `p1` SMALLINT NOT NULL DEFAULT 0,
    `p2` SMALLINT NOT NULL DEFAULT 0,
    `p3` SMALLINT NOT NULL DEFAULT 0,
    `p4` SMALLINT NOT NULL DEFAULT 0,
    `p5` SMALLINT NOT NULL DEFAULT 0,
    `p6` SMALLINT NOT NULL DEFAULT 0,
    `p7` SMALLINT NOT NULL DEFAULT 0,
    `p8` SMALLINT NOT NULL DEFAULT 0,
    `p9` SMALLINT NOT NULL DEFAULT 0,
    `p10` SMALLINT NOT NULL DEFAULT 0,
    `p11` SMALLINT NOT NULL DEFAULT 0,
    `p12` SMALLINT NOT NULL DEFAULT 0,
    `p13` SMALLINT NOT NULL DEFAULT 0,
    `p14` SMALLINT NOT NULL DEFAULT 0,
    `p15` SMALLINT NOT NULL DEFAULT 0,
    `p16` SMALLINT NOT NULL DEFAULT 0,
    `p17` SMALLINT NOT NULL DEFAULT 0,
    `p18` SMALLINT NOT NULL DEFAULT 0,
    `p19` SMALLINT NOT NULL DEFAULT 0,
    `p20` SMALLINT NOT NULL DEFAULT 0,
    `p21` SMALLINT NOT NULL DEFAULT 0,
    `p22` SMALLINT NOT NULL DEFAULT 0,
    `p23` SMALLINT NOT NULL DEFAULT 0,
    `p24` SMALLINT NOT NULL DEFAULT 0,
    `p25` SMALLINT NOT NULL DEFAULT 0,
    `p26` SMALLINT NOT NULL DEFAULT 0,
    `p27` SMALLINT NOT NULL DEFAULT 0,
    `p28` SMALLINT NOT NULL DEFAULT 0,
    `p29` SMALLINT NOT NULL DEFAULT 0,
    `p30` SMALLINT NOT NULL DEFAULT 0,
    `p31` SMALLINT NOT NULL DEFAULT 0,
    `p32` SMALLINT NOT NULL DEFAULT 0,
    `p33` SMALLINT NOT NULL DEFAULT 0,
    `p34` SMALLINT NOT NULL DEFAULT 0,
    `p35` SMALLINT NOT NULL DEFAULT 0,
    `p36` SMALLINT NOT NULL DEFAULT 0,
    `p37` SMALLINT NOT NULL DEFAULT 0,
    `p38` SMALLINT NOT NULL DEFAULT 0,
    `p39` SMALLINT NOT NULL DEFAULT 0,
    `p40` SMALLINT NOT NULL DEFAULT 0,
    `p41` SMALLINT NOT NULL DEFAULT 0,
    `p42` SMALLINT NOT NULL DEFAULT 0,
    `p43` SMALLINT NOT NULL DEFAULT 0,
    `p44` SMALLINT NOT NULL DEFAULT 0,
    `p45` SMALLINT NOT NULL DEFAULT 0,
    `p46` SMALLINT NOT NULL DEFAULT 0,
    `p47` SMALLINT NOT NULL DEFAULT 0,
    `p48` SMALLINT NOT NULL DEFAULT 0,
    `p49` SMALLINT NOT NULL DEFAULT 0,
    `p50` SMALLINT NOT NULL DEFAULT 0,
    `p51` SMALLINT NOT NULL DEFAULT 0,
    `p52` SMALLINT NOT NULL DEFAULT 0,
    `p53` SMALLINT NOT NULL DEFAULT 0,
    `p54` SMALLINT NOT NULL DEFAULT 0,
    `p55` SMALLINT NOT NULL DEFAULT 0,
    `p56` SMALLINT NOT NULL DEFAULT 0,
    `p57` SMALLINT NOT NULL DEFAULT 0,
    `p58` SMALLINT NOT NULL DEFAULT 0,
    `p59` SMALLINT NOT NULL DEFAULT 0,
    `p60` SMALLINT NOT NULL DEFAULT 0,
    `p61` SMALLINT NOT NULL DEFAULT 0,
    `p62` SMALLINT NOT NULL DEFAULT 0,
    `p63` SMALLINT NOT NULL DEFAULT 0,
    `p64` SMALLINT NOT NULL DEFAULT 0,
    `p65` SMALLINT NOT NULL DEFAULT 0,
    `p66` SMALLINT NOT NULL DEFAULT 0,
    `p67` SMALLINT NOT NULL DEFAULT 0,
    `p68` INTEGER NOT NULL DEFAULT 0,
    `p69` INTEGER NOT NULL DEFAULT 0,
    `p70` SMALLINT NOT NULL DEFAULT 0,
    `p71` INTEGER NOT NULL DEFAULT 0,
    `p72` INTEGER NOT NULL DEFAULT 0,
    `p73` INTEGER NOT NULL DEFAULT 0,
    `p74` INTEGER NOT NULL DEFAULT 0,
    `p75` INTEGER NOT NULL DEFAULT 0,
    `p76` INTEGER NOT NULL DEFAULT 0,
    `p77` INTEGER NOT NULL DEFAULT 0,
    `p78` INTEGER NOT NULL DEFAULT 0,
    `p79` INTEGER NOT NULL DEFAULT 0,
    `p80` INTEGER NOT NULL DEFAULT 0,
    `p81` INTEGER NOT NULL DEFAULT 0,
    `p82` INTEGER NOT NULL DEFAULT 0,
    `p83` INTEGER NOT NULL DEFAULT 0,
    `p84` INTEGER NOT NULL DEFAULT 0,
    `p85` INTEGER NOT NULL DEFAULT 0,
    `p86` INTEGER NOT NULL DEFAULT 0,
    `p87` INTEGER NOT NULL DEFAULT 0,
    `p88` INTEGER NOT NULL DEFAULT 0,
    `p89` INTEGER NOT NULL DEFAULT 0,
    `p90` INTEGER NOT NULL DEFAULT 0,
    `p91` INTEGER NOT NULL DEFAULT 0,
    `p92` INTEGER NOT NULL DEFAULT 0,
    `p93` INTEGER NOT NULL DEFAULT 0,
    `p94` INTEGER NOT NULL DEFAULT 0,
    `p95` INTEGER NOT NULL DEFAULT 0,
    `p96` INTEGER NOT NULL DEFAULT 0,
    `p97` INTEGER NOT NULL DEFAULT 0,
    `p98` INTEGER NOT NULL DEFAULT 0,
    `p99` INTEGER NOT NULL DEFAULT 0,
    `p100` INTEGER NOT NULL DEFAULT 0,
    `p101` INTEGER NOT NULL DEFAULT 0,
    `p102` INTEGER NOT NULL DEFAULT 0,
    `p103` INTEGER NOT NULL DEFAULT 0,
    `p104` INTEGER NOT NULL DEFAULT 0,
    `p105` INTEGER NOT NULL DEFAULT 0,
    `p106` INTEGER NOT NULL DEFAULT 0,
    `p107` INTEGER NOT NULL DEFAULT 0,
    `p108` INTEGER NOT NULL DEFAULT 0,
    `p109` INTEGER NOT NULL DEFAULT 0,
    `p110` INTEGER NOT NULL DEFAULT 0,
    `p111` INTEGER NOT NULL DEFAULT 0,
    `p112` INTEGER NOT NULL DEFAULT 0,
    `p113` INTEGER NOT NULL DEFAULT 0,
    `p114` INTEGER NOT NULL DEFAULT 0,
    `p115` INTEGER NOT NULL DEFAULT 0,
    `p116` INTEGER NOT NULL DEFAULT 0,

    UNIQUE INDEX `genset03_gensetId_key`(`gensetId`),
    PRIMARY KEY (`paramId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `genset03` ADD CONSTRAINT `genset03_gensetId_fkey` FOREIGN KEY (`gensetId`) REFERENCES `genset`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
