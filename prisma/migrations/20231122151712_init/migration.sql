-- CreateTable
CREATE TABLE `genset` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `imei` VARCHAR(191) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `genset_id_key`(`id`),
    UNIQUE INDEX `genset_imei_key`(`imei`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
