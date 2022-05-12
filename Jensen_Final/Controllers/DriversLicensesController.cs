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

    [Authorize(Roles = "DMV, LAW")]
    [Route("api/[controller]")]
    [ApiController]
    public class DriversLicensesController : ControllerBase
    {
        private readonly Jensen_DatabaseContext _context;

        public DriversLicensesController(Jensen_DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/DriversLicenses
        [HttpGet]
        public async Task<ActionResult<IEnumerable<DriversLicense>>> GetDriversLicenses()
        {
            return await _context.DriversLicenses.ToListAsync();
        }

        // GET: api/DriversLicenses/5
        [HttpGet("{id}")]
        public async Task<ActionResult<DriversLicense>> GetDriversLicense(int id)
        {
            var driversLicense = await _context.DriversLicenses.FindAsync(id);

            if (driversLicense == null)
            {
                return NotFound();
            }

            return driversLicense;
        }

        // PUT: api/DriversLicenses/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutDriversLicense(int id, DriversLicense driversLicense)
        {
            if (id != driversLicense.DriversLicenseId)
            {
                return BadRequest();
            }

            _context.Entry(driversLicense).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!DriversLicenseExists(id))
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

        // POST: api/DriversLicenses
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<DriversLicense>> PostDriversLicense(DriversLicense driversLicense)
        {
            _context.DriversLicenses.Add(driversLicense);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (DriversLicenseExists(driversLicense.DriversLicenseId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetDriversLicense", new { id = driversLicense.DriversLicenseId }, driversLicense);
        }

        // DELETE: api/DriversLicenses/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteDriversLicense(int id)
        {
            var driversLicense = await _context.DriversLicenses.FindAsync(id);
            if (driversLicense == null)
            {
                return NotFound();
            }

            _context.DriversLicenses.Remove(driversLicense);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool DriversLicenseExists(int id)
        {
            return _context.DriversLicenses.Any(e => e.DriversLicenseId == id);
        }
    }
}
