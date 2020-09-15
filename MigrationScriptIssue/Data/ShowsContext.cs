using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MigrationScriptIssue.Data
{
    public class ShowsContext : DbContext
    {
        public ShowsContext(DbContextOptions<ShowsContext> options) : base(options)
        {
        }

        public DbSet<Show> Shows { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.Entity<Show>().HasData(new Show { Id = 1, Title = "Game of Thrones" });
        }
    }
}
