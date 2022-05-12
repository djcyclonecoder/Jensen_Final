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
    public class InfractionsMovingViolationsController : ControllerBase
    {
        private readonly Jensen_DatabaseContext _context;

        public InfractionsMovingViolationsController(Jensen_DatabaseContext context)
        {
            _context = context;
        }

        // GET: api/InfractionsMovingViolations
        [HttpGet]
        public async Task<ActionResult<IEnumerable<InfractionsMovingViolation>>> GetInfractionsMovingViolations()
        {
            return await _context.InfractionsMovingViolations.ToListAsync();
        }

        // GET: api/InfractionsMovingViolations/5
        [HttpGet("{id}")]
        public async Task<ActionResult<InfractionsMovingViolation>> GetInfractionsMovingViolation(int id)
        {
            var infractionsMovingViolation = await _context.InfractionsMovingViolations.FindAsync(id);

            if (infractionsMovingViolation == null)
            {
                return NotFound();
            }

            return infractionsMovingViolation;
        }

        // PUT: api/InfractionsMovingViolations/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutInfractionsMovingViolation(int id, InfractionsMovingViolation infractionsMovingViolation)
        {
            if (id != infractionsMovingViolation.InfractionsMvId)
            {
                return BadRequest();
            }

            _context.Entry(infractionsMovingViolation).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!InfractionsMovingViolationExists(id))
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

        // POST: api/InfractionsMovingViolations
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<InfractionsMovingViolation>> PostInfractionsMovingViolation(InfractionsMovingViolation infractionsMovingViolation)
        {
            _context.InfractionsMovingViolations.Add(infractionsMovingViolation);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (InfractionsMovingViolationExists(infractionsMovingViolation.InfractionsMvId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetInfractionsMovingViolation", new { id = infractionsMovingViolation.InfractionsMvId }, infractionsMovingViolation);
        }

        // DELETE: api/InfractionsMovingViolations/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteInfractionsMovingViolation(int id)
        {
            var infractionsMovingViolation = await _context.InfractionsMovingViolations.FindAsync(id);
            if (infractionsMovingViolation == null)
            {
                return NotFound();
            }

            _context.InfractionsMovingViolations.Remove(infractionsMovingViolation);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool InfractionsMovingViolationExists(int id)
        {
            return _context.InfractionsMovingViolations.Any(e => e.InfractionsMvId == id);
        }
    }
}
