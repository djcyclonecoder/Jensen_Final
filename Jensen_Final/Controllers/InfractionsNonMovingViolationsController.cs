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
    public class InfractionsNonMovingViolationsController : ControllerBase
    {
        private readonly Jensen_DatabaseContext _context;

        public InfractionsNonMovingViolationsController(Jensen_DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/InfractionsNonMovingViolations
        [HttpGet]
        public async Task<ActionResult<IEnumerable<InfractionsNonMovingViolation>>> GetInfractionsNonMovingViolations()
        {
            return await _context.InfractionsNonMovingViolations.ToListAsync();
        }

        // GET: api/InfractionsNonMovingViolations/5
        [HttpGet("{id}")]
        public async Task<ActionResult<InfractionsNonMovingViolation>> GetInfractionsNonMovingViolation(int id)
        {
            var infractionsNonMovingViolation = await _context.InfractionsNonMovingViolations.FindAsync(id);

            if (infractionsNonMovingViolation == null)
            {
                return NotFound();
            }

            return infractionsNonMovingViolation;
        }

        // PUT: api/InfractionsNonMovingViolations/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInfractionsNonMovingViolation(int id, InfractionsNonMovingViolation infractionsNonMovingViolation)
        {
            if (id != infractionsNonMovingViolation.InfractionsNmvId)
            {
                return BadRequest();
            }

            _context.Entry(infractionsNonMovingViolation).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractionsNonMovingViolationExists(id))
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

        // POST: api/InfractionsNonMovingViolations
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<InfractionsNonMovingViolation>> PostInfractionsNonMovingViolation(InfractionsNonMovingViolation infractionsNonMovingViolation)
        {
            _context.InfractionsNonMovingViolations.Add(infractionsNonMovingViolation);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractionsNonMovingViolationExists(infractionsNonMovingViolation.InfractionsNmvId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfractionsNonMovingViolation", new { id = infractionsNonMovingViolation.InfractionsNmvId }, infractionsNonMovingViolation);
        }

        // DELETE: api/InfractionsNonMovingViolations/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInfractionsNonMovingViolation(int id)
        {
            var infractionsNonMovingViolation = await _context.InfractionsNonMovingViolations.FindAsync(id);
            if (infractionsNonMovingViolation == null)
            {
                return NotFound();
            }

            _context.InfractionsNonMovingViolations.Remove(infractionsNonMovingViolation);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractionsNonMovingViolationExists(int id)
        {
            return _context.InfractionsNonMovingViolations.Any(e => e.InfractionsNmvId == id);
        }
    }
}
