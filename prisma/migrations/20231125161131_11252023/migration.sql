-- CreateTable
CREATE TABLE `genset01` (
    `paramId` INTEGER NOT NULL AUTO_INCREMENT,
    `gensetId` INTEGER NOT NULL,
    `b0` BOOLEAN NOT NULL DEFAULT false,
    `b1` BOOLEAN NOT NULL DEFAULT false,
    `b2` BOOLEAN NOT NULL DEFAULT false,
    `b3` BOOLEAN NOT NULL DEFAULT false,
    `b4` BOOLEAN NOT NULL DEFAULT false,
    `b5` BOOLEAN NOT NULL DEFAULT false,
    `b6` BOOLEAN NOT NULL DEFAULT false,
    `b7` BOOLEAN NOT NULL DEFAULT false,
    `b8` BOOLEAN NOT NULL DEFAULT false,
    `b9` BOOLEAN NOT NULL DEFAULT false,
    `b10` BOOLEAN NOT NULL DEFAULT false,
    `b11` BOOLEAN NOT NULL DEFAULT false,
    `b12` BOOLEAN NOT NULL DEFAULT false,
    `b13` BOOLEAN NOT NULL DEFAULT false,
    `b14` BOOLEAN NOT NULL DEFAULT false,
    `b15` BOOLEAN NOT NULL DEFAULT false,
    `b16` BOOLEAN NOT NULL DEFAULT false,
    `b17` BOOLEAN NOT NULL DEFAULT false,
    `b18` BOOLEAN NOT NULL DEFAULT false,
    `b19` BOOLEAN NOT NULL DEFAULT false,
    `b20` BOOLEAN NOT NULL DEFAULT false,
    `b21` BOOLEAN NOT NULL DEFAULT false,
    `b22` BOOLEAN NOT NULL DEFAULT false,
    `b23` BOOLEAN NOT NULL DEFAULT false,
    `b24` BOOLEAN NOT NULL DEFAULT false,
    `b25` BOOLEAN NOT NULL DEFAULT false,
    `b26` BOOLEAN NOT NULL DEFAULT false,
    `b27` BOOLEAN NOT NULL DEFAULT false,
    `b28` BOOLEAN NOT NULL DEFAULT false,
    `b29` BOOLEAN NOT NULL DEFAULT false,
    `b30` BOOLEAN NOT NULL DEFAULT false,
    `b31` BOOLEAN NOT NULL DEFAULT false,
    `b32` BOOLEAN NOT NULL DEFAULT false,
    `b33` BOOLEAN NOT NULL DEFAULT false,
    `b34` BOOLEAN NOT NULL DEFAULT false,
    `b35` BOOLEAN NOT NULL DEFAULT false,
    `b36` BOOLEAN NOT NULL DEFAULT false,
    `b37` BOOLEAN NOT NULL DEFAULT false,
    `b38` BOOLEAN NOT NULL DEFAULT false,
    `b39` BOOLEAN NOT NULL DEFAULT false,
    `b40` BOOLEAN NOT NULL DEFAULT false,
    `b41` BOOLEAN NOT NULL DEFAULT false,
    `b42` BOOLEAN NOT NULL DEFAULT false,
    `b43` BOOLEAN NOT NULL DEFAULT false,
    `b44` BOOLEAN NOT NULL DEFAULT false,
    `b45` BOOLEAN NOT NULL DEFAULT false,
    `b46` BOOLEAN NOT NULL DEFAULT false,
    `b47` BOOLEAN NOT NULL DEFAULT false,
    `b48` BOOLEAN NOT NULL DEFAULT false,
    `b49` BOOLEAN NOT NULL DEFAULT false,
    `b50` BOOLEAN NOT NULL DEFAULT false,
    `b51` BOOLEAN NOT NULL DEFAULT false,
    `b52` BOOLEAN NOT NULL DEFAULT false,
    `b53` BOOLEAN NOT NULL DEFAULT false,
    `b54` BOOLEAN NOT NULL DEFAULT false,
    `b55` BOOLEAN NOT NULL DEFAULT false,
    `b56` BOOLEAN NOT NULL DEFAULT false,
    `b57` BOOLEAN NOT NULL DEFAULT false,
    `b58` BOOLEAN NOT NULL DEFAULT false,
    `b59` BOOLEAN NOT NULL DEFAULT false,
    `b60` BOOLEAN NOT NULL DEFAULT false,
    `b61` BOOLEAN NOT NULL DEFAULT false,
    `b62` BOOLEAN NOT NULL DEFAULT false,
    `b63` BOOLEAN NOT NULL DEFAULT false,
    `b64` BOOLEAN NOT NULL DEFAULT false,
    `b65` BOOLEAN NOT NULL DEFAULT false,
    `b66` BOOLEAN NOT NULL DEFAULT false,
    `b67` BOOLEAN NOT NULL DEFAULT false,
    `b68` BOOLEAN NOT NULL DEFAULT false,
    `b69` BOOLEAN NOT NULL DEFAULT false,
    `b70` BOOLEAN NOT NULL DEFAULT false,
    `b71` BOOLEAN NOT NULL DEFAULT false,
    `b72` BOOLEAN NOT NULL DEFAULT false,
    `b73` BOOLEAN NOT NULL DEFAULT false,
    `b74` BOOLEAN NOT NULL DEFAULT false,
    `b75` BOOLEAN NOT NULL DEFAULT false,
    `b76` BOOLEAN NOT NULL DEFAULT false,
    `b77` BOOLEAN NOT NULL DEFAULT false,
    `b78` BOOLEAN NOT NULL DEFAULT false,
    `b79` BOOLEAN NOT NULL DEFAULT false,
    `b80` BOOLEAN NOT NULL DEFAULT false,
    `b81` BOOLEAN NOT NULL DEFAULT false,
    `b82` BOOLEAN NOT NULL DEFAULT false,
    `b83` BOOLEAN NOT NULL DEFAULT false,
    `b84` BOOLEAN NOT NULL DEFAULT false,
    `b85` BOOLEAN NOT NULL DEFAULT false,
    `b86` BOOLEAN NOT NULL DEFAULT false,
    `b87` BOOLEAN NOT NULL DEFAULT false,
    `b88` BOOLEAN NOT NULL DEFAULT false,
    `b89` BOOLEAN NOT NULL DEFAULT false,
    `b90` BOOLEAN NOT NULL DEFAULT false,
    `b91` BOOLEAN NOT NULL DEFAULT false,
    `b92` BOOLEAN NOT NULL DEFAULT false,
    `b93` BOOLEAN NOT NULL DEFAULT false,
    `b94` BOOLEAN NOT NULL DEFAULT false,
    `b95` BOOLEAN NOT NULL DEFAULT false,
    `b96` BOOLEAN NOT NULL DEFAULT false,
    `b97` BOOLEAN NOT NULL DEFAULT false,
    `b98` BOOLEAN NOT NULL DEFAULT false,
    `b99` BOOLEAN NOT NULL DEFAULT false,
    `b100` BOOLEAN NOT NULL DEFAULT false,
    `b101` BOOLEAN NOT NULL DEFAULT false,
    `b102` BOOLEAN NOT NULL DEFAULT false,
    `b103` BOOLEAN NOT NULL DEFAULT false,
    `b104` BOOLEAN NOT NULL DEFAULT false,
    `b105` BOOLEAN NOT NULL DEFAULT false,
    `b106` BOOLEAN NOT NULL DEFAULT false,
    `b107` BOOLEAN NOT NULL DEFAULT false,
    `b108` BOOLEAN NOT NULL DEFAULT false,
    `b109` BOOLEAN NOT NULL DEFAULT false,
    `b110` BOOLEAN NOT NULL DEFAULT false,
    `b111` BOOLEAN NOT NULL DEFAULT false,
    `b112` BOOLEAN NOT NULL DEFAULT false,
    `b113` BOOLEAN NOT NULL DEFAULT false,
    `b114` BOOLEAN NOT NULL DEFAULT false,
    `b115` BOOLEAN NOT NULL DEFAULT false,
    `b116` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `genset01_gensetId_key`(`gensetId`),
    PRIMARY KEY (`paramId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `genset01` ADD CONSTRAINT `genset01_gensetId_fkey` FOREIGN KEY (`gensetId`) REFERENCES `genset`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
