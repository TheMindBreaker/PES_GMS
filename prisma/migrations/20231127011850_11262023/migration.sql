/*
  Warnings:

  - You are about to drop the `usergensets` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `usergensets` DROP FOREIGN KEY `userGensets_gensetId_fkey`;

-- DropForeignKey
ALTER TABLE `usergensets` DROP FOREIGN KEY `userGensets_userId_fkey`;

-- AlterTable
ALTER TABLE `genset` ADD COLUMN `companyId` INTEGER NULL;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `companyId` INTEGER NULL;

-- DropTable
DROP TABLE `usergensets`;

-- CreateTable
CREATE TABLE `company` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `taxid` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `company_id_key`(`id`),
    UNIQUE INDEX `company_taxid_key`(`taxid`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `user` ADD CONSTRAINT `user_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `genset` ADD CONSTRAINT `genset_companyId_fkey` FOREIGN KEY (`companyId`) REFERENCES `company`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
