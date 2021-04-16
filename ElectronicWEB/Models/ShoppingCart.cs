using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace ElectronicWEB.Models
{
    public class ShoppingCart
    {
        DienTuModel db = new DienTuModel();
        public List<SANPHAM> ListNewProduct(int top)
        {
            return db.SANPHAMs.OrderByDescending(x => x.NgaySX).Take(top).ToList();
        }

        public int GetTotal()
        {
            int total = 0;
            var list = new List<Item>();
            foreach (Item item in list)
            {
                total += item.Quantity;
            }
            return total;
        }
        //public List<Item> lst = new List<Item>();
        public void InsertItem(string name, int id, double price)
        {
            var list = new List<Item>();
            bool check = false;
            foreach (Item item in list)
            {
                if (item.Product.MaSP == id)
                {
                    check = true;
                    item.Quantity += 1;
                    break;
                }
            }
            if (!check)
            {
                Item item = new Item();
                item.Product.MaSP = id;
                item.Product.TenSP = name;
                item.Product.Gia = price;
                item.Quantity = 1;
               list.Add(item);
            }
        }
        //public void UpdateAmount(int id, int amount)
        //{
        //    foreach (Item item in lst)
        //    {
        //        if (item.id == id)
        //        {
        //            if (amount != 0)
        //            {
        //                item.amount = amount;
        //            }
        //            else
        //            {
        //                RemoveItem(id);
        //            }
        //        }
        //    }
        //}
        //public void RemoveItem(int id)
        //{
        //    foreach (Item item in lst)
        //    {
        //        if (item.id == id)
        //        {
        //            lst.Remove(item);
        //        }
        //    }
        //}
        //public int GetTotal()
        //{
        //    int total = 0;
        //    foreach (Item item in lst)
        //    {
        //        total += item.amount;
        //    }
        //    return total;
        //}
        //public double GetTotalMoney()
        //{
        //    double total = 0.0;
        //    foreach (Item item in lst)
        //    {
        //        total += item.amount * item.price;
        //    }
        //    return total;
        //}
    }
}