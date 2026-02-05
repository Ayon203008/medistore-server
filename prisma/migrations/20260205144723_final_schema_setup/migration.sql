/*
  Warnings:

  - You are about to drop the column `price` on the `Orders` table. All the data in the column will be lost.
  - Added the required column `category_id` to the `Medicine` table without a default value. This is not possible if the table is not empty.
  - Added the required column `seller_id` to the `Medicine` table without a default value. This is not possible if the table is not empty.
  - Added the required column `medicine_id` to the `Order_Items` table without a default value. This is not possible if the table is not empty.
  - Added the required column `order_id` to the `Order_Items` table without a default value. This is not possible if the table is not empty.
  - Added the required column `seller_id` to the `Order_Items` table without a default value. This is not possible if the table is not empty.
  - Added the required column `customer_id` to the `Orders` table without a default value. This is not possible if the table is not empty.
  - Added the required column `customer_id` to the `Reviews` table without a default value. This is not possible if the table is not empty.
  - Added the required column `medicine_id` to the `Reviews` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Medicine" ADD COLUMN     "category_id" TEXT NOT NULL,
ADD COLUMN     "seller_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Order_Items" ADD COLUMN     "medicine_id" TEXT NOT NULL,
ADD COLUMN     "order_id" TEXT NOT NULL,
ADD COLUMN     "seller_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Orders" DROP COLUMN "price",
ADD COLUMN     "customer_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "Reviews" ADD COLUMN     "customer_id" TEXT NOT NULL,
ADD COLUMN     "medicine_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "user" ADD COLUMN     "isBanned" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "role" "ROLE" NOT NULL DEFAULT 'CUSTOMER';

-- AddForeignKey
ALTER TABLE "Medicine" ADD CONSTRAINT "Medicine_category_id_fkey" FOREIGN KEY ("category_id") REFERENCES "Categories"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Medicine" ADD CONSTRAINT "Medicine_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Reviews" ADD CONSTRAINT "Reviews_medicine_id_fkey" FOREIGN KEY ("medicine_id") REFERENCES "Medicine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_customer_id_fkey" FOREIGN KEY ("customer_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order_Items" ADD CONSTRAINT "Order_Items_order_id_fkey" FOREIGN KEY ("order_id") REFERENCES "Orders"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order_Items" ADD CONSTRAINT "Order_Items_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Order_Items" ADD CONSTRAINT "Order_Items_medicine_id_fkey" FOREIGN KEY ("medicine_id") REFERENCES "Medicine"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
