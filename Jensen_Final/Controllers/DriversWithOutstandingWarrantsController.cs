#nullable disable
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Jensen_Final.Data;
using Jensen_Final.Models;
using Microsoft.AspNetCore.Authorization;

namespace Jensen_Final.Controllers
{
    [Authorize(Roles = "LAW")]
    [Route("api/[controller]")]
    [ApiController]
    public class DriversWithOutstandingWarrantsController : ControllerBase
    {
        private readonly Jensen_DatabaseContext _context;

        public DriversWithOutstandingWarrantsController(Jensen_DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/DriversWithOutstandingWarrants
        [HttpGet]
        public async Task<ActionResult<IEnumerable<DriversWithOutstandingWarrant>>> GetDriversWithOutstandingWarrants()
        {
            return await _context.DriversWithOutstandingWarrants.ToListAsync();
        }

        // GET: api/DriversWithOutstandingWarrants/5
        [HttpGet("{id}")]
        public async Task<ActionResult<DriversWithOutstandingWarrant>> GetDriversWithOutstandingWarrant(int id)
        {
            var driversWithOutstandingWarrant = await _context.DriversWithOutstandingWarrants.FindAsync(id);

            if (driversWithOutstandingWarrant == null)
            {
                return NotFound();
            }

            return driversWithOutstandingWarrant;
        }

        // PUT: api/DriversWithOutstandingWarrants/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDriversWithOutstandingWarrant(int id, DriversWithOutstandingWarrant driversWithOutstandingWarrant)
        {
            if (id != driversWithOutstandingWarrant.WarrantId)
            {
                return BadRequest();
            }

            _context.Entry(driversWithOutstandingWarrant).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DriversWithOutstandingWarrantExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/DriversWithOutstandingWarrants
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<DriversWithOutstandingWarrant>> PostDriversWithOutstandingWarrant(DriversWithOutstandingWarrant driversWithOutstandingWarrant)
        {
            _context.DriversWithOutstandingWarrants.Add(driversWithOutstandingWarrant);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (DriversWithOutstandingWarrantExists(driversWithOutstandingWarrant.WarrantId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetDriversWithOutstandingWarrant", new { id = driversWithOutstandingWarrant.WarrantId }, driversWithOutstandingWarrant);
        }

        // DELETE: api/DriversWithOutstandingWarrants/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDriversWithOutstandingWarrant(int id)
        {
            var driversWithOutstandingWarrant = await _context.DriversWithOutstandingWarrants.FindAsync(id);
            if (driversWithOutstandingWarrant == null)
            {
                return NotFound();
            }

            _context.DriversWithOutstandingWarrants.Remove(driversWithOutstandingWarrant);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DriversWithOutstandingWarrantExists(int id)
        {
            return _context.DriversWithOutstandingWarrants.Any(e => e.WarrantId == id);
        }
    }
}
